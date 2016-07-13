def reformat_languages(languages)
  new_hash={}
  languages.each do |lang_style,language|
    language.each do |language, lang_type|
      new_hash[language]=lang_type
      new_hash[language][:style]=[lang_style]
    end
  end

  languages.each do |lang_style,language|
    language.each do |language, lang_type|
      if new_hash[language][:style].count>=1
        new_hash[language][:style]<<[lang_style]
        new_hash[language][:style].flatten!
        new_hash[language][:style]=new_hash[language][:style].uniq
      end
    end
  end
  # puts new_hash
  return new_hash
end