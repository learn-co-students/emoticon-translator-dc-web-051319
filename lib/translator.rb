# require modules here
require "yaml"
# get_emotion {English => Japanesse} get-meaning {japanese > meaing}
def load_library(file_path)
  new_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  library = YAML.load_file(file_path)
  
  library.each do |meaning, emoticons|
    emoticons.each_with_index do |emoticon, index|
      if index == 0
        new_hash["get_emoticon"][emoticon] = emoticons[1]
      else
        new_hash["get_meaning"][emoticon] = meaning
      end
    end
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"].each do |english, japanese|
    if english == emoticon
      return japanese
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"].each do |japanese, meaning|
    if japanese == emoticon
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end



