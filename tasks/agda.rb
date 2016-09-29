# encoding: utf-8


require 'rubygems'
require 'bundler/setup'
require 'nokogiri'


module Agda

  RE_BEGIN    = /.*\\begin\{code\}(.*)/m
  RE_END      = /.*\\end\{code\}.*/m
  RE_FILENAME = /(\d{4})-(\d{2})-(\d{2})-([0-9A-Za-z.\-\_,]+)\.html(.*)/
  RE_IMPLICIT = Regexp.compile([
      '((<a[^>]*>\s*∀\s*<\/a[^>]*>)(<a[^>]*>\s*<\/a[^>]*>)*)?',
      '<a[^>]*>\s*\{\s*<\/a[^>]*>',
      '(<a[^>]*>[^=\}]*<\/a[^>]*>)*',
      '<a[^>]*>\s*\}\s*<\/a[^>]*>',
      '((<a[^>]*>\s*<\/a[^>]*>)*(<a[^>]*>\s*→\s*<\/a[^>]*>))?',
      '(<a[^>]*>\s*<\/a[^>]*>)*'].join,
      Regexp::MULTILINE)

  STDLIB_MODULE_LIST = ['Algebra','Algebra.FunctionProperties','Algebra.FunctionProperties.Core','Algebra.Monoid-solver','Algebra.Morphism','Algebra.Operations','Algebra.Properties.AbelianGroup','Algebra.Properties.BooleanAlgebra','Algebra.Properties.BooleanAlgebra.Expression','Algebra.Properties.DistributiveLattice','Algebra.Properties.Group','Algebra.Properties.Lattice','Algebra.Properties.Ring','Algebra.RingSolver','Algebra.RingSolver.AlmostCommutativeRing','Algebra.RingSolver.Lemmas','Algebra.RingSolver.Natural-coefficients','Algebra.RingSolver.Simple','Algebra.Structures','Category.Applicative','Category.Applicative.Indexed','Category.Applicative.Predicate','Category.Functor','Category.Functor.Predicate','Category.Monad','Category.Monad.Continuation','Category.Monad.Identity','Category.Monad.Indexed','Category.Monad.Partiality','Category.Monad.Partiality.All','Category.Monad.Predicate','Category.Monad.State','Coinduction','Data.AVL','Data.AVL.IndexedMap','Data.AVL.Sets','Data.Bin','Data.Bool','Data.Bool.Base','Data.Bool.Properties','Data.Bool.Show','Data.BoundedVec','Data.BoundedVec.Inefficient','Data.Char','Data.Char.Base','Data.Char.Core','Data.Cofin','Data.Colist','Data.Colist.Infinite-merge','Data.Conat','Data.Container','Data.Container.Any','Data.Container.Combinator','Data.Container.FreeMonad','Data.Container.Indexed','Data.Container.Indexed.Combinator','Data.Container.Indexed.Core','Data.Container.Indexed.FreeMonad','Data.Covec','Data.DifferenceList','Data.DifferenceNat','Data.DifferenceVec','Data.Digit','Data.Empty','Data.Fin','Data.Fin.Dec','Data.Fin.Properties','Data.Fin.Subset','Data.Fin.Subset.Properties','Data.Fin.Substitution','Data.Fin.Substitution.Example','Data.Fin.Substitution.Lemmas','Data.Fin.Substitution.List','Data.Float','Data.Graph.Acyclic','Data.Integer','Data.Integer.Addition.Properties','Data.Integer.Base','Data.Integer.Divisibility','Data.Integer.Multiplication.Properties','Data.Integer.Properties','Data.List','Data.List.All','Data.List.All.Properties','Data.List.Any','Data.List.Any.BagAndSetEquality','Data.List.Any.Membership','Data.List.Any.Properties','Data.List.Base','Data.List.Countdown','Data.List.NonEmpty','Data.List.NonEmpty.Properties','Data.List.Properties','Data.List.Reverse','Data.M','Data.M.Indexed','Data.Maybe','Data.Maybe.Base','Data.Nat','Data.Nat.Base','Data.Nat.Coprimality','Data.Nat.DivMod','Data.Nat.Divisibility','Data.Nat.GCD','Data.Nat.GCD.Lemmas','Data.Nat.InfinitelyOften','Data.Nat.LCM','Data.Nat.Primality','Data.Nat.Properties','Data.Nat.Properties.Simple','Data.Nat.Show','Data.Plus','Data.Product','Data.Product.N-ary','Data.Rational','Data.ReflexiveClosure','Data.Sign','Data.Sign.Properties','Data.Star','Data.Star.BoundedVec','Data.Star.Decoration','Data.Star.Environment','Data.Star.Fin','Data.Star.List','Data.Star.Nat','Data.Star.Pointer','Data.Star.Properties','Data.Star.Vec','Data.Stream','Data.String','Data.String.Base','Data.Sum','Data.Unit','Data.Unit.Base','Data.Unit.NonEta','Data.Vec','Data.Vec.Equality','Data.Vec.N-ary','Data.Vec.Properties','Data.W','Data.W.Indexed','Foreign.Haskell','Function','Function.Bijection','Function.Equality','Function.Equivalence','Function.Injection','Function.Inverse','Function.LeftInverse','Function.Related','Function.Related.TypeIsomorphisms','Function.Surjection','IO','IO.Primitive','Induction','Induction.Lexicographic','Induction.Nat','Induction.WellFounded','Irrelevance','Level','Record','Reflection','Relation.Binary','Relation.Binary.Consequences','Relation.Binary.Consequences.Core','Relation.Binary.Core','Relation.Binary.EqReasoning','Relation.Binary.Flip','Relation.Binary.HeterogeneousEquality','Relation.Binary.HeterogeneousEquality.Core','Relation.Binary.Indexed','Relation.Binary.Indexed.Core','Relation.Binary.InducedPreorders','Relation.Binary.List.NonStrictLex','Relation.Binary.List.Pointwise','Relation.Binary.List.StrictLex','Relation.Binary.NonStrictToStrict','Relation.Binary.On','Relation.Binary.OrderMorphism','Relation.Binary.PartialOrderReasoning','Relation.Binary.PreorderReasoning','Relation.Binary.Product.NonStrictLex','Relation.Binary.Product.Pointwise','Relation.Binary.Product.StrictLex','Relation.Binary.Properties.DecTotalOrder','Relation.Binary.Properties.Poset','Relation.Binary.Properties.Preorder','Relation.Binary.Properties.StrictPartialOrder','Relation.Binary.Properties.StrictTotalOrder','Relation.Binary.Properties.TotalOrder','Relation.Binary.PropositionalEquality','Relation.Binary.PropositionalEquality.Core','Relation.Binary.PropositionalEquality.TrustMe','Relation.Binary.Reflection','Relation.Binary.SetoidReasoning','Relation.Binary.Sigma.Pointwise','Relation.Binary.Simple','Relation.Binary.StrictPartialOrderReasoning','Relation.Binary.StrictToNonStrict','Relation.Binary.Sum','Relation.Binary.Vec.Pointwise','Relation.Nullary','Relation.Nullary.Decidable','Relation.Nullary.Implication','Relation.Nullary.Negation','Relation.Nullary.Product','Relation.Nullary.Sum','Relation.Nullary.Universe','Relation.Unary','Relation.Unary.PredicateTransformer','Size','Universe']

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
      unless a['href'].nil?
        moduleName, anchor = a['href'].split('.html')
        if STDLIB_MODULE_LIST.include?(moduleName) or moduleName.start_with?('Agda')
          a['href']   = "https://agda.github.io/agda-stdlib/#{a['href']}"
          a['target'] = "_blank"
        else
          file = Dir.glob("**/#{moduleName}.lagda").first
          dir  = File.dirname(file)
          path = File.join(dir,File.basename(file,File.extname(file)))
          if dir == '_posts'
            front_matter = YAML.load_file(file)
            year = front_matter['date'].year
            name = moduleName.gsub(/^(\d{4})-(\d{2})-(\d{2})/,'')
            a['href'] = "/#{year}/#{name}/#{anchor}"
          else
            a['href'] = "/#{path}/#{anchor}"
          end
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
      pre = pre.gsub(/\{/,'&#123;').gsub(/\}/,'&#125;')
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
