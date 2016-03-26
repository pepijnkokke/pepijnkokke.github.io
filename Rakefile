require 'rubygems'
require 'bundler/setup'
require 'tmpdir'
require_relative 'tasks/fix_agda_html'

RE_IDENT  = /[0-9A-Za-z.\-\_,]+/
AGDA_HOME = ENV['AGDA_HOME']

task :default do
  Dir.glob('_posts/*.lagda') do |post|
    Rake::Task[post.ext('.md')].invoke
  end
end

rule '.md' => '.lagda' do |t|
  Dir.mktmpdir do |tmp|

    # dirtmp file for our target
    filename = nil

    # move ALL *.lagda files to tmpdir
    Dir.glob('_posts/*.lagda') do |source|
      contents    = File.read(source)
      module_name = contents.match(/^module (#{RE_IDENT})/).to_a.fetch(1, "main")
      target      = "#{tmp}/#{module_name}.lagda"
      filename    = target if source == t.source
      cp source, target
    end

    # compile our target and extract HTML
    sh("agda -i#{tmp} -i#{AGDA_HOME} --html --html-dir=#{tmp} #{filename}")
    File.write(t.name, fix_agda_html(filename))
  end
end
