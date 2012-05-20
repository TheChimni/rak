require 'rspec'
require_relative '../lib/anagram'

describe Anagram do
  it 'should find anagrams' do
    finder = AnagramFinder.new
    finder.get_anagrams('link').should == ['kiln']
  end
end
