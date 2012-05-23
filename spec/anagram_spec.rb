require 'rspec'
require_relative '../lib/anagram'

describe AnagramFinder do
  it 'should find anagrams' do
    finder = AnagramFinder.new
    finder.dictionary = { 'ikln' => ['link', 'kiln'] }
    finder.get_anagrams('link').should == ['kiln']
    finder.get_anagrams('link').should include 'kiln'
  end

  it 'should find anagrams when the dictionary is not initialised' do
    pending
    finder = AnagramFinder.new
    finder.get_anagrams('link').should == ['kiln']
    finder.get_anagrams('link').should include 'kiln'
  end

  it 'should return sorted word for a given word' do
    finder = AnagramFinder.new
    finder.sort_word('doctor').should == 'cdoort'
  end
end

describe WordListReader do
  it 'should open a file and return an array of words in the file' do
    reader = WordListReader.new('./wordlist.txt')
    words = reader.read
    words.should include "abase\n"
  end

  it "should throw an exception if the file doesn't exist" do
    # reader = WordListReader.new('./wordlist1.txt')
    # lambda { WordListReader.new('./wordlist1.txt') }.should raise_error
    expect { WordListReader.new('./wordlist1.txt') }.to raise_error
  end
end
