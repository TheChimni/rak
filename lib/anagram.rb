class AnagramFinder
  attr_accessor :dictionary

  def get_anagrams(word)
    # load the dictionary if it has not been loaded already (read from file)
    sorted_word = sort_word(word)
    dictionary[sorted_word].reject { |x| x == word }
  end

  def sort_word(word)
    word.chars.sort.join
  end

  # Implement a method that loads the dictionary if its not already loaded
  # 1. Check whether its already loaded
  # 2. Get an array of words from the WordListReader
  # 3. Iterate the array of words and put each one into the dictionary
end

class WordListReader
  # Implements a method that returns an array of words given a filename
  attr_accessor :words

  def initialize(filepath)
    @filepath = filepath
  end

  def read
    if File.exists(@filepath) 
      file = File.open(@filepath, 'r')
      words = IO.readlines(@filepath)
    else
      raise "boom"
    end
  end
end

