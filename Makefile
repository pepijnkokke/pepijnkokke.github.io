agda := $(shell find src -type f -name '*.lagda')
agdai := $(shell find src -type f -name '*.agdai')
markdown := $(subst src/,_posts/,$(subst .lagda,.md,$(agda)))
AGDA2HTML_FLAGS := --verbose --link-to-local-agda-names --use-jekyll=_posts/

default: AGDA2HTML_FLAGS += --link-to-agda-stdlib
default: $(markdown)

test: build
	ruby -S bundle exec htmlproofer _site

test-offline: build
	ruby -S bundle exec htmlproofer _site --disable-external

_posts/:
	mkdir -p _posts/

_posts/%.md: src/%.lagda | _posts/
	agda2html --verbose --link-to-agda-stdlib --use-jekyll=_posts/ -i $< -o $@ 2>&1 \
		| sed '/^Generating.*/d; /^Warning\: HTML.*/d; /^reached from the.*/d; /^\s*$$/d'

build-offline: $(markdown)
	ruby -S bundle exec jekyll build --incremental

.phony: build-offline

build: AGDA2HTML_FLAGS += --link-to-agda-stdlib
build: $(markdown)
	ruby -S bundle exec jekyll build --incremental

.phony: build

serve:
	ruby -S bundle exec jekyll serve --incremental

.phony: serve

clean:
ifneq ($(strip $(agdai)),)
	rm $(agdai)
endif

.phony: clean
	bundle exec jekyll clean

clobber:
ifneq ($(strip $(markdown)),)
	rm -f $(markdown)
endif

.phony: clobber


# Travis Setup (install Agda, the Agda standard library, agda2html, acknowledgements, etc.)
travis-setup:\
	$(HOME)/.local/bin/agda\
	$(HOME)/.local/bin/agda2html\
	$(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION)/src\
	$(HOME)/.agda/defaults\
	$(HOME)/.agda/libraries

.phony: travis-setup


travis-install-agda2html: $(HOME)/.local/bin/agda2html

$(HOME)/.local/bin/agda2html:
	curl -L https://github.com/wenkokke/agda2html/archive/master.zip -o $(HOME)/agda2html-master.zip
	unzip -qq $(HOME)/agda2html-master.zip -d $(HOME)
	cd $(HOME)/agda2html-master;\
		stack install

travis-uninstall-agda2html:
	rm -rf $(HOME)/agda2html-master/
	rm $(HOME)/.local/bin/agda2html

travis-reinstall-agda2html: travis-uninstall-agda2html travis-install-agda2html

.phony: travis-install-agda2html travis-uninstall-agda2html travis-reinstall-agda2html



travis-install-agda:\
	$(HOME)/.local/bin/agda\
	$(HOME)/.agda/defaults\
	$(HOME)/.agda/libraries

$(HOME)/.agda/defaults:
	echo "standard-library" >> $(HOME)/.agda/defaults

$(HOME)/.agda/libraries:
	echo "$(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION)/standard-library.agda-lib" >> $(HOME)/.agda/libraries

$(HOME)/.local/bin/agda:
	curl -L https://github.com/agda/agda/archive/v$(AGDA_VERSION).zip -o $(HOME)/agda-$(AGDA_VERSION).zip
	unzip -qq $(HOME)/agda-$(AGDA_VERSION).zip -d $(HOME)
	cd $(HOME)/agda-$(AGDA_VERSION);\
		stack install --stack-yaml=stack-8.0.2.yaml

travis-uninstall-agda:
	rm -rf $(HOME)/agda-$(AGDA_VERSION)/
	rm -f $(HOME)/.local/bin/agda
	rm -f $(HOME)/.local/bin/agda-mode

travis-reinstall-agda: travis-uninstall-agda travis-install-agda

.phony: travis-install-agda travis-uninstall-agda travis-reinstall-agda


travis-install-agda-stdlib: $(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION)/src

$(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION)/src:
	curl -L https://github.com/agda/agda-stdlib/archive/v$(AGDA_STDLIB_VERSION).zip -o $(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION).zip
	unzip -qq $(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION).zip -d $(HOME)
	mkdir -p $(HOME)/.agda

travis-uninstall-agda-stdlib:
	rm $(HOME)/.agda/defaults
	rm $(HOME)/.agda/libraries
	rm -rf $(HOME)/agda-stdlib-$(AGDA_STDLIB_VERSION)/

travis-reinstall-agda-stdlib: travis-uninstall-agda-stdlib travis-install-agda-stdlib

.phony: travis-install-agda-stdlib travis-uninstall-agda-stdlib travis-reinstall-agda-stdlib
