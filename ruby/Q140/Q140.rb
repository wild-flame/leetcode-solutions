# David Lin
# Method: Just search the string step by step with word_dict.
# TLE

# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
  [].tap{ |result| _search(s, word_dict, [], result) }  
end

private def _search(s, word_dict, trace, result)
  return result << trace.join(" ") if s == "" and trace.length != 0
  for word in word_dict
    if (/^#{word}/ =~ s).nil? == false
      string = s.gsub(/^#{word}/,"") 
      _search(string, word_dict, trace.dup << word, result)
    end
  end
end

# print word_break("catsanddog", %w(cat cats and sand dog))
print word_break("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", ["a","aaaa","b"])
# print word_break("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
# ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])

