require 'pry'
require 'yaml'

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |meaning, emoticons|
    english, translation = emoticons
    library["get_emoticon"][english] = translation 
    library["get_meaning"][translation] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  
  if result 
    result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  #binding.pry
  if result 
    result
  else
    return "Sorry, that emoticon was not found"
  end
end