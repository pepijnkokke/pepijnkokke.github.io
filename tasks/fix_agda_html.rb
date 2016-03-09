# encoding: UTF-8

require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

RE_BEGIN = /.*\\begin\{code\}(.*)/m
RE_END   = /.*\\end\{code\}.*/m


# String -> [String]
def extract_text(contents)
  contents.split('\begin{code}').to_a.collect { |item| item.split('\end{code}').last }
end


# String -> [String]
def extract_code(path)
  document = Nokogiri::HTML::DocumentFragment.parse ""
  block    = nil
  tokens   = File.open(path) { |f| Nokogiri::HTML(f).css("html body pre a") }

  # Adjust HREF to link to local file or Agda documentation.
  tokens.each do |a|
    basename = File.basename path
    unless a['href'].nil?
      if a['href'] =~ /^#{Regexp.escape basename}/
         a['href'] = a['href'].sub /^#{basename}/, ''
      else
         a['href'] = "https://agda.github.io/agda-stdlib/#{a['href']}"
         a['target'] = "_blank"
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

  return document.css("pre").collect(&:to_html)
end


# FilePath -> String
def fix_agda_html(path)
  dirname  = File.dirname(path)
  basename = File.basename(path,'.*')
  text     = extract_text(File.read("#{dirname}/#{basename}.lagda"))
  code     = extract_code("#{dirname}/#{basename}.html")
  return text.zip(code).join
end
