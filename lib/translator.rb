require 'pry'
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)

  result = emoticons.each_with_object({}) do |(name, value_set), final_hash|
    if !final_hash[name]
      final_hash[name] = {
        :english => value_set[0],
        :japanese => value_set[1]
      }
    end
    result
  end
end

def get_japanese_emoticon(path, emoticon)
  emoticons =load_library(path)
  
  emoticons.each do |mood, face|
    return face[:japanese] if face[:english] == emoticon
  end
    "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  
  emoticons.each do |mood, face|
    return mood if face[:japanese] == emoticon
  end
    "Sorry, that emoticon was not found"
end