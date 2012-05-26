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

  it 'should load the dictionary of words if the dictionary is empty' do
    WordListReader.any_instance.stub(:read => ['link', 'kiln', 'donkey'])
    finder =  AnagramFinder.new
    finder.load_dictionary
    finder.dictionary.should_not be_nil
    finder.dictionary.count.should == 2
    finder.dictionary['ikln'].count.should == 2
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

  it "should open a file and return an array of words in the file (stub)" do
    #IO.stub(:readlines).with('./wordlist.txt').and_return(['lovely', 'gorgeous', 'kind'])
    IO.stub(:readlines => ['lovely', 'gorgeous', 'kind'])
    words = WordListReader.new('./wordlist.txt').read
    words.should include 'lovely'
    words.should_not include 'mean'
  end

  it "should open a file and return an array of words in the file (mock)" do
    IO.should_receive(:readlines).with('./wordlist.txt').and_return(['lovely', 'gorgeous', 'kind'])
    words = WordListReader.new('./wordlist.txt').read
  end

  it "should throw an exception if the file doesn't exist" do
    # reader = WordListReader.new('./wordlist1.txt')
    # lambda { WordListReader.new('./wordlist12.txt').read }.should raise_error
    expect { WordListReader.new('./wordlist1.txt').read }.to raise_error
  end
end
