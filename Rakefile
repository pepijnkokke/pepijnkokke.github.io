require          'rubygems'
require          'bundler/setup'
require          'tmpdir'
require          'yaml'
require_relative 'tasks/agda'


TheGreatDalmuti_files = ['all.js','lib.js','out.js','rts.js','runmain.js']


task :default do

  Rake::Task['pubs.md'].invoke

  Dir.glob('_posts/*.lagda') do |post|
    Rake::Task[post.ext('.md')].invoke
  end

  TheGreatDalmuti_files.each do |f|
    Rake::Task["js/TheGreatDalmuti.jsexe/#{f}"].invoke
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


file 'pubs.md' => 'pubs.bib' do |t|
  Dir.mktmpdir do |tmp|
    sh "bibtex2html -nodoc -nodoi -nobibsource -nokeywords -noabstract -r -revkeys -d -o #{tmp}/pubs pubs.bib"

    doc = Nokogiri::HTML::DocumentFragment.parse(File.read("#{tmp}/pubs.html"))
    doc.xpath('comment()').remove()
    doc.at('hr').xpath('following-sibling::*').remove()
    doc.at('hr').remove()

    File.write "pubs.md", <<~"PUBS"
    ---
    layout    : page
    title     : Publications
    permalink : /pubs/
    ---
    #{doc.to_html()}
    PUBS
  end
end


def TheGreatDalmuti_build
  Dir.chdir('src/TheGreatDalmuti/') do
    sh("cabal configure --ghcjs")
    sh("cabal build")
  end
  TheGreatDalmuti_files.each do |f|
    cp "src/TheGreatDalmuti/dist/build/TheGreatDalmuti/TheGreatDalmuti.jsexe/#{f}",
       "js/TheGreatDalmuti.jsexe/#{f}"
  end
end

TheGreatDalmuti_files.each do |f|
  file "js/TheGreatDalmuti.jsexe/#{f}" => 'src/TheGreatDalmuti/TheGreatDalmuti.hs' do
    TheGreatDalmuti_build()
  end
end
