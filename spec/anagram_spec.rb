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

  it 'should open wordlist.txt and return each word in the file' do
    pending
    reader = WordListReader.new
  end
end
