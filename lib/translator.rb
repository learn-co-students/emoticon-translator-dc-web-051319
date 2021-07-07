require 'yaml'
require 'pry'

def load_library(path)
    library = YAML.load_file(path)
    emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
    library.each do |meaning, icons|
        emoticons["get_meaning"][icons[1]] = meaning
        emoticons["get_emoticon"][icons[0]] = icons[1]
    end
    emoticons        
end

def get_japanese_emoticon(path, emoticon)
    translation = nil
    library = load_library(path)
    library["get_emoticon"].each do |english, japanese|
        if emoticon == english
            translation = japanese
        end
    end
    !(translation) ? translation = "Sorry, that emoticon was not found" : nil
    translation
end

def get_english_meaning(path, emoticon)
    translation = nil
    library = load_library(path)
    library["get_meaning"].each do |japanese, meaning|
        if emoticon == japanese
            translation = meaning
        end
    end
    !(translation) ? translation = "Sorry, that emoticon was not found" : nil
    translation
end
