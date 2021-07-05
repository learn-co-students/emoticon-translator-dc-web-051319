# require modules here
require 'yaml'
require 'pry'
def load_library(directory)
  # code goes here
  get_meaning, get_emoticon = {}, {}
  YAML.load_file(directory).each do |desc, data|
    get_meaning[data[1]] = desc
    get_emoticon[data[0]] = data[1]
  end
  translations = {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
  translations
end

def get_japanese_emoticon(library, emoticon)
    # code goes here
  dictionary = load_library(library)
  return "Sorry, that emoticon was not found" if dictionary["get_emoticon"][emoticon].nil?
  dictionary["get_emoticon"][emoticon]
end

def  get_english_meaning(library, emoticon)

  # code goes here
  dictionary = load_library(library)
 return "Sorry, that emoticon was not found" if dictionary["get_meaning"][emoticon].nil?
 dictionary["get_meaning"][emoticon]
end
