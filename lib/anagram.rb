class AnagramFinder
  attr_accessor :dictionary

  def initialize
  end

  def get_anagrams(word)
    # load the dictionary if it has not been loaded already (read from file)
    load_dictionary
    sorted_word = sort_word(word)
    if dictionary[sorted_word].nil?
      []
    else
      dictionary[sorted_word].reject { |x| x == word }
    end
  end

  def load_dictionary
    if @dictionary.nil?
      @dictionary = Hash.new
      words = WordListReader.new("./wordlist.txt").read
      words.each do |word|
        if @dictionary.has_key?(sort_word(word))
          # Assuming the word list has no duplicates
          @dictionary[sort_word(word)] << word
        else
          @dictionary[sort_word(word)] = [word]
        end
      end
    end
  end

  def sort_word(word)
    word.chars.sort.join
  end
end

class WordListReader
  # Implements a method that returns an array of words given a filename
  attr_accessor :words

  def initialize(filepath)
    @filepath = filepath
    # @file = File.open(@filepath, 'r') -- Commented out as it is not required
  end

  def read
    begin    
      words = IO.readlines(@filepath)
    rescue Exception => detail
      puts detail.backtrace.join("\n")
      STDERR.puts "#{$!}"
      raise
    ensure
    end
  end

#  This is the ideal way of doing File IO but retaining above code for learning purposes
  # def read
  #   File.open(@filepath, 'r') do |file|
  #     file.readlines
  #   end
  # end
end

