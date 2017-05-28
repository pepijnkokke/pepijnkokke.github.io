agda := $(wildcard src/*.lagda)
agdai := $(wildcard src/*.agdai)
markdown := $(subst src/,_posts/,$(subst .lagda,.md,$(agda)))

default: $(markdown)

_posts/%.md: src/%.lagda
	agda2html --link-to-agda-stdlib --strip-implicit-args --jekyll -i $< -o $@

clobber: clean
	rm $(markdown)

serve: clean
	@ruby -S bundle exec jekyll serve

install:
	@ruby -S gem install bundler
	@ruby -S bundle install

guard:
	@ruby -S bundle exec guard

rake:
	@ruby -S bundle exec rake

clean:
	@ruby -S bundle exec jekyll clean

.phony: clean clobber rake guard serve install
