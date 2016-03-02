# encoding: UTF-8

require 'nokogiri'
require 'kramdown'

RE_BEGIN = /.*\\begin\{code\}(.*)/m
RE_END   = /.*\\end\{code\}.*/m

def fix_agda_html(file)
  filename = Regexp.escape(File.basename(file))
  in_code  = false
  doc      = Nokogiri::HTML::DocumentFragment.parse ""
  group    = ""
  groups   = doc
  tokens   = File.open(file) { |f| Nokogiri::HTML(f) }.css("html body pre a")

  tokens.each do |a|
    unless a['href'].nil?
      if a['href'] =~ /^#{filename}/
        a['href'] = a['href'].sub /^#{filename}/, ''
      else
        a['href']   = "https://agda.github.io/agda-stdlib/#{a['href']}"
        a['target'] = "_blank"
      end
    end
  end

  tokens.each do |token|

    unless in_code # we are NOT in code
      matches = token.text.match RE_BEGIN
      if matches # we are ENTERING code
        if group.instance_of? String and not group.empty?
          groups << Nokogiri::XML::Text.new("#{group}\n\n", doc)
        end
        unless token.text =~ RE_END
          in_code = true
          group         = Nokogiri::XML::Node.new("pre", doc)
          group[:class] = "Agda"
          groups << group
          unless matches[1].nil?
            text = matches[1].gsub(/^#{$/}/,'').gsub(/#{$/}$/,'')
            group << Nokogiri::XML::Text.new(text, doc)
          end
        end
      else
        group   += token.text
      end

    else # we ARE in code
      if token.text =~ RE_END # we are LEAVING code
        matches = token.text.match RE_BEGIN
        if matches
          group         = Nokogiri::XML::Node.new("pre", doc)
          group[:class] = "Agda"
          groups << group
          unless matches[1].nil?
            text = matches[1].gsub(/^#{$/}/,'').gsub(/#{$/}$/,'')
            group << Nokogiri::XML::Text.new(text, doc)
          end
        else
          in_code = false
          group   = "\n\n"
        end
      else
        group << token
      end
    end
  end

  return doc
end
