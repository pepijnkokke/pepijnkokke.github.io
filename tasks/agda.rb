# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

module Agda

  RE_BEGIN    = /.*\\begin\{code\}(.*)/m
  RE_END      = /.*\\end\{code\}.*/m
  RE_FILENAME = /(\d{4})-(\d{2})-(\d{2})-([0-9A-Za-z.\-\_,]+)\.html(.*)/
  RE_IMPLICIT = %r{
    ( <a((?!>).)*>∀<\/a> (<a((?!>).)*>\s+<\/a>)* )?  # ∀?
    <a((?!>).)*>{<\/a>                               # {
    (((?!\}).)*)                                      # .*
    <a((?!>).)*>}<\/a>                               # }
    ( (<a((?!>).)*>\s+<\/a>)* <a((?!>).)*>→<\/a> )?  # →?
    (<a((?!>).)*>\s+<\/a>)*                          # \s*
  }x


  # String -> [String]
  def self.extract_text(contents)
    contents.split('\begin{code}').to_a.collect { |item| item.split('\end{code}').last }
  end

  # String -> [String] -> [String]
  def self.extract_code(path,hide_implicit)
    document = Nokogiri::HTML::DocumentFragment.parse ""
    block    = nil
    tokens   = File.open(path) { |f| Nokogiri::HTML(f).css("html body pre a") }

    # Adjust HREF to link to local file or Agda documentation.
    tokens.each do |a|
      basename = File.basename path
      unless a['href'].nil?
        fileinfos = a['href'].scan(RE_FILENAME)
        if fileinfos.empty?
          a['href']   = "https://agda.github.io/agda-stdlib/#{a['href']}"
          a['target'] = "_blank"
        else
          year = fileinfos[0][0]
          name = fileinfos[0][3]
          misc = fileinfos[0][4]
          a['href'] = "/#{year}/#{name}/#{misc}"
        end
      end
    end

    # Group code blocks in <pre> tags.
    tokens.collect do |tok|
      # We're NOT in a code block:
      if block.nil?
        # We encounter a BEGIN tag and not an END tag:
        if (match = tok.text.match RE_BEGIN) and (not tok.text.match RE_END)
          block = Nokogiri::XML::Node.new("pre", document)
          block[:class] = "Agda"
          document << block
          unless match[1].nil?
            block << Nokogiri::XML::Text.
                    new(match[1].sub(/^#{$/}/,'').sub(/#{$/}$/,''), document)
          end
        end

      # We ARE in a code block:
      else
        # We encounter an END tag:
        if tok.text.match RE_END
          block = nil
          # We encounter a BEGIN tag:
          if (match = tok.text.match RE_BEGIN)
            block = Nokogiri::XML::Node.new("pre", document)
            block[:class] = "Agda"
            document << block
            unless match[1].nil?
              block << Nokogiri::XML::Text.
                      new(match[1].sub(/^#{$/}/,'').sub(/#{$/}$/,''), document)
            end
          end
        else
          block << tok
        end
      end
    end

    return document.css("pre").collect do |pre|
      pre = pre.to_html
      pre = pre.gsub(RE_IMPLICIT, '') if hide_implicit
      pre
    end
  end


  # FilePath -> String
  def self.fix_html(text,html,hide_implicit=false)
    text = extract_text(File.read(text))
    code = extract_code(html,hide_implicit)
    return text.zip(code).join
  end

end
