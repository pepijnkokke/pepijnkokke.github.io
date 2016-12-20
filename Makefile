serve: clean
	@ruby -S bundle exec jekyll server

guard:
	@ruby -S bundle exec guard

rake:
	@ruby -S bundle exec rake

clean:
	@ruby -S bundle exec jekyll clean
