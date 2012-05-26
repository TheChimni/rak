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
  # attr_accessor :filepath

  def initialize(filepath)
    @filepath = filepath
    @file = File.open(@filepath, 'r')
  end

  def read

    begin
      #  Why should I put File.open outside the begin block?
      
      words = IO.readlines(@filepath)
      # file.close  Where to put file.close?
    # rescue => detail
    #   print detail.backtrace.join("\n")
    #   raise
    # raise StandardError
    rescue Exception
      STDERR.puts "#{$!}"
      raise
    ensure
      @file.close
    end
  end
end

