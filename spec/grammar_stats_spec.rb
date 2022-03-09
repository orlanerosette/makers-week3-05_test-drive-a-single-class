require 'grammar_stats'

RSpec.describe GrammarStats do

  context "given a sentence that starts with a capital letter and ends with a full stop" do
    it "returns true" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("I am a simple sentence.")
      expect(result).to eq true
    end
  end

  context "given a sentence that does not start with a capital letter, ends with a full stop" do
    it "returns false" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("i am a simple sentence.")
      expect(result).to eq false
    end
  end

  context "given a sentence that starts with a capital letter and has no ending punctuation mark" do
    it "returns false" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("I am a simple sentence")
      expect(result).to eq false
    end
  end

  context "given a sentence that starts with a capital letter and ends with an exclamation mark" do
    it "returns true" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("I am a simple sentence!")
      expect(result).to eq true
    end
  end

  context "given a sentence that starts with a capital letter and ends with a comma" do
    it "returns false" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("I am a simple sentence,")
      expect(result).to eq false
    end
  end

  context "given a sentence completely in upper case and ends with an exclamation mark" do
    it "returns true" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("I AM A SIMPLE SENTENCE!")
      expect(result).to eq true
    end
  end

  context "given a sentence that starts with a capital letter and ends with a question mark" do
    it "returns true" do
      grammar_checker = GrammarStats.new
      result = grammar_checker.check("Am I a simple sentence?")
      expect(result).to eq true
    end
  end

  it "returns as an integer the percentage of 'true' texts" do
    grammar_checker = GrammarStats.new
    grammar_checker.check("Am I a simple sentence?")
    grammar_checker.check("I AM A SIMPLE SENTENCE!")
    grammar_checker.check("I am a simple sentence,")
    grammar_checker.check("I am a simple sentence!")
    expect(grammar_checker.percentage_good).to eq 75
  end

  it "returns as an integer the percentage of 'true' texts" do
    grammar_checker = GrammarStats.new
    grammar_checker.check("I am a simple sentence,")
    grammar_checker.check("I am a simple sentence!")
    expect(grammar_checker.percentage_good).to eq 50
  end

  
end