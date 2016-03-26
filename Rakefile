require          'rubygems'
require          'bundler/setup'
require          'tmpdir'
require          'yaml'
require_relative 'tasks/agda'


task :default do
  Dir.glob('_posts/*.lagda') do |post|
    Rake::Task[post.ext('.md')].invoke
  end
end


rule '.md' => '.lagda' do |t|
  Dir.mktmpdir do |tmp|

    # move ALL *.lagda files to tmpdir
    Dir.glob('_posts/*.lagda') do |source|
      cp source, "#{tmp}/#{File.basename(source)}"
    end

    # compile our target and extract HTML
    target       = "#{tmp}/#{File.basename(t.source)}"
    front_matter = YAML.load_file(t.source)
    sh("agda -i#{tmp} -i#{ENV['AGDA_HOME']} --html --html-dir=#{tmp} #{target}")
    File.write(t.name,
        Agda::fix_html(t.source,target.ext('.html'),front_matter['hide_implicit']))
  end
end
