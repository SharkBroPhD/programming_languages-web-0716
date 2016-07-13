require 'pry'

 # # languages = {
 # #    {
 #      :oo => {
 #        :ruby => {
 #          :type => "interpreted"
 #        },
 #        :javascript => {
 #          :type => "interpreted"
 #        },
 #        :python => {
 #          :type => "interpreted"
 #        },
 #        :java => {
 #          :type => "compiled"
 #        }
 #      },
 #      :functional => {
 #        :clojure => {
 #          :type => "compiled"
 #        },
 #        :erlang => {
 #          :type => "compiled"
 #        },
 #        :scala => {
 #          :type => "compiled"
 #        },
 #        :javascript => {
 #          :type => "interpreted"
 #        }
     
 #      }
 #    }
# #-------------- should equal
# {
#   :ruby => {
#     :type => "interpreted",
#     :style => [:oo]
#   },
#   :javascript => {
#     :type => "interpreted",
#     :style => [:oo, :functional]
#   },
#   :python => {
#     :type => "interpreted",
#     :style => [:oo]
#   },
#   :java => {
#     :type => "compiled",
#     :style => [:oo]
#   },
#   :clojure => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :erlang => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :scala => {
#     :type => "compiled",
#     :style => [:functional]
#   }
# }

test_hash = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
      }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }   
  }
}


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

reformat_languages(test_hash)