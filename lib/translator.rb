
require 'yaml'

# require modules here

def load_library(yaml_file)
response = {"get_meaning" => {}, "get_emoticon" => {}}
translation = YAML.load_file(yaml_file)
translation.each do |names, emotes|
  response["get_meaning"][emotes[1]] = names
  response["get_emoticon"][emotes[0]] = emotes[1]
  end  # code goes here
  response
end


def get_japanese_emoticon(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
  library["get_emoticon"].each do |english, japanese|
    if emoticon == english
      response = japanese
    end
  end
  if response == nil
    "Sorry, that emoticon was not found"
  else
    return response
  end
end
  # code goes here




def get_english_meaning(yaml_file, emoticon)
    library = load_library(yaml_file)
    response = nil
    library["get_meaning"].each do |emote, meaning|
      if emote == emoticon
        response = meaning
      end
    end
    if response == nil
      "Sorry, that emoticon was not found"
    else
      return response
    end
  end

  # code goes here
