# require modules here
require "yaml"
require "pry"



def load_library(path)
  # code goes here
  emote = YAML.load_file(path)
  rHash={"get_meaning" => {} , "get_emoticon" => {} }
    emote.each{|k,v| 
    rHash["get_meaning"]=rHash["get_meaning"].merge(v.last => k)
    rHash["get_emoticon"]=rHash["get_emoticon"].merge(v.first => v.last)
  }
  rHash
end

def get_japanese_emoticon(path,emoticon)
  # code goes here
  information = load_library(path)
  information["get_emoticon"][emoticon] != nil ? information["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  # code goes here
  load_library(path)["get_meaning"][emoticon] != nil ? load_library(path)["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end