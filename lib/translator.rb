require 'yaml'
require 'pry'


def load_library(fi)
  raw_yaml = {}
  yaml = {}
  raw_yaml = YAML.load_file(fi)
  
  yaml['get_meaning'] = {}
  yaml['get_emoticon'] = {}
  #yaml['get_meaning'][] = 
  raw_yaml.each do |k,v|
  yaml['get_meaning'][v[1]] = k
  yaml['get_emoticon'][v[0]] = v[1]

end 
 
   
  return yaml
  
end

def get_japanese_emoticon(fi, emoticon)
 yaml =  load_library(fi)
 if yaml['get_emoticon'].keys.include?(emoticon) 
 return yaml['get_emoticon'][emoticon]
 else 
   return "Sorry, that emoticon was not found" 
end
end 

def get_english_meaning(fi, emoticon)
  yaml = load_library(fi) 
  if yaml['get_emoticon'].values.include?(emoticon)
    return yaml['get_meaning'][emoticon]
  else 
    return "Sorry, that emoticon was not found"
end
end 