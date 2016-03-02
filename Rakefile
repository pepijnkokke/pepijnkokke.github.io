require 'tmpdir'
require_relative 'tasks/fix_agda_html'

RE_IDENT  = /[0-9A-Za-z.\-\_]+/
AGDA_HOME = ENV['AGDA_HOME']

task :default do
  Dir.glob('_posts/*.lagda') do |post|
    Rake::Task[post.ext('.markdown')].invoke
  end
end

rule '.markdown' => '.lagda' do |t|
  Dir.mktmpdir do |tmp|
    contents = File.read(t.source)
    basename = contents.match(/^module (#{RE_IDENT})/)[1]
    filename = "#{tmp}/#{basename}.lagda"
    cp t.source, filename
    sh("agda -i#{tmp} -i#{AGDA_HOME} --html --html-dir=#{tmp} #{filename}")
    File.write(t.name, fix_agda_html(filename.ext('.html')))
  end
end
