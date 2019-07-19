SHELL := /bin/bash
AGDA := $(shell find . -type f -and \( -path '*/src/*' \) -and -name '*.lagda.md')
AGDAI := $(shell find . -type f -and \( -path '*/src/*' \) -and -name '*.agdai')
MARKDOWN := $(subst src/,_posts/,$(subst .lagda.md,.md,$(AGDA)))

ifeq ($(AGDA_STDLIB_VERSION),)
AGDA_STDLIB_URL := https://agda.github.io/agda-stdlib/
else
AGDA_STDLIB_URL := https://agda.github.io/agda-stdlib/v$(AGDA_STDLIB_VERSION)/
endif

default: $(MARKDOWN)

# Build blog and test hyperlinks
test: build
	ruby -S bundle exec htmlproofer _site

# Build blog and test hyperlinks offline
test-offline: build
	ruby -S bundle exec htmlproofer _site --disable-external

# Convert literal Agda to Markdown
_posts/:
	mkdir -p _posts/

define AGDA_template
in := $(1)
out := $(subst src/,_posts/,$(subst .lagda.md,.md,$(1)))
$$(out) : in  = $(1)
$$(out) : out = $(subst src/,_posts/,$(subst .lagda.md,.md,$(1)))
$$(out) : $$(in) | _posts/
	@echo "Processing $$(subst ./,,$$(in))"
	./highlight.sh $$(subst ./,,$$(in)) --include-path=src/
endef

$(foreach agda,$(AGDA),$(eval $(call AGDA_template,$(agda))))

build: $(MARKDOWN)
	ruby -S bundle exec jekyll build --incremental --drafts

.phony: build

serve:
	ruby -S bundle exec jekyll serve --incremental --drafts

.phony: serve

clean:
	rm -f .agda-stdlib.sed .links-*.sed
ifneq ($(strip $(AGDAI)),)
	rm $(AGDAI)
endif

.phony: clean
	bundle exec jekyll clean

clobber:
ifneq ($(strip $(MARKDOWN)),)
	rm -f $(MARKDOWN)
endif

.phony: clobber


# Travis Setup (install Agda, the Agda standard library, etc.)
travis-setup:\
	$(HOME)/.local/bin/agda\
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
