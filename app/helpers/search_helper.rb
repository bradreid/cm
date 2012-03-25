module SearchHelper

     #custom query highlighter
     def query_highlight(text, phrases, *args)
       options = args.extract_options!
       unless args.empty?
         options[:highlighter] = args[0] || '<b class="highlight">\1</b>'
       end
       options.reverse_merge!(:highlighter => '<b class="highlight">\1</b>')

       if text.blank? || phrases.blank?
         text
       else

      words = Array.new
      phrases.split("\s").each do |word|
        words << word
        words << word.stem unless word.stem.nil?
      end        
      words.uniq!

      min_word = words.first
      min_pos = text.length

      words.each do |word| 
        position = text.index(word)        
        if !position.nil? && position < min_pos
          min_word = word 
          min_pos = position
        end  
      end

      #text = excerpt(text, min_word).nil? ? truncate(text, :length =>  120) : excerpt(text, min_word) 

      match = words.map { |p| Regexp.escape(p) }.join('|')
      text.gsub(/(#{match})(?!(?:[^<]*?)(?:["'])[^<>]*>)/i, options[:highlighter])              

      end
    end

end