# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'tmpdir'
require 'yaml'


################################################################################
### Build Agda files                                                         ###
################################################################################

task :agda, :paths do |t, args|
  args.paths.each do |path|
    Rake::Task[path.ext('.md')].invoke
  end
end

rule '.md' => '.lagda' do |t|
  front_matter = YAML.load_file(t.source)
  cmd = ["agda2html"]
  cmd << "-f #{t.source}"
  cmd << "-t #{t.name}"
  cmd << "-i _posts"
  cmd << "-i _drafts"
  cmd << "-i sf"
  cmd << "--verbose"
  cmd << "--link-to-agda-stdlib"
  cmd << "--strip-implicit-args"\
    if front_matter['hide-implicit']
  sh(cmd.join ' ')

end


################################################################################
### Build the list of publications                                           ###
################################################################################

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



################################################################################
### Build TheGreatDalmuti using GHC-JS                                       ###
################################################################################

TheGreatDalmuti_files = ['all.js','lib.js','out.js','rts.js','runmain.js']

def TheGreatDalmuti_build
  Dir.chdir('misc/TheGreatDalmuti/') do
    sh("stack setup")
    sh("stack build")
  end
  TheGreatDalmuti_files.each do |f|
    cp File.join('misc/TheGreatDalmuti/.stack-work',
                 'dist/x86_64-osx/Cabal-1.22.8.0_ghcjs',
                 'build/TheGreatDalmuti/TheGreatDalmuti.jsexe',f),
       "js/TheGreatDalmuti.jsexe/#{f}"
  end
end

file 'js/TheGreatDalmuti.jsexe' do
  mkdir_p 'js/TheGreatDalmuti.jsexe'
end

TheGreatDalmuti_files.each do |f|
  file "js/TheGreatDalmuti.jsexe/#{f}" => [
         'js/TheGreatDalmuti.jsexe',
         'misc/TheGreatDalmuti/TheGreatDalmuti.hs'] do
    TheGreatDalmuti_build()
  end
end


################################################################################
### DEFAULT TASK                                                             ###
################################################################################

task :default => \
     [['pubs.md'],
      Dir.glob('**/*.lagda').collect{ |f| f.ext('.md') },
      TheGreatDalmuti_files.collect{ |f| "js/TheGreatDalmuti.jsexe/#{f}" }].flatten
