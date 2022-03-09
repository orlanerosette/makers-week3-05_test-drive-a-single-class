require 'diary_entry'

RSpec.describe DiaryEntry do

  it "returns the title as a string" do
    diary = DiaryEntry.new("Wednesday 9th March 2022", "sample content")
    expect(diary.title).to eq ("Wednesday 9th March 2022")
  end

  it "returns the contents as a string" do
    diary = DiaryEntry.new("Wednesday 9th March 2022", "sample content")
    expect(diary.contents).to eq ("sample content")
  end

  it "returns the number of words in the contents as an integer" do
    diary = DiaryEntry.new("Wednesday 9th March 2022", "sample content")
    expect(diary.count_words).to eq 2
  end

  it "returns the number of words in the contents as an integer" do
    diary = DiaryEntry.new("Wednesday 9th March 2022", "another sample content")
    expect(diary.count_words).to eq 3
  end


  context "returns the estimated reading time in minutes given a string between 200 and up to 400 words" do
    it "given a string with 300 words it returns 2" do
       diary = DiaryEntry.new("Wednesday 9th March 2022","one " * 300)
       diary.count_words
      expect(diary.reading_time(200)).to eq 2
    end

    it "given a string with 400 words it returns 2" do
       diary = DiaryEntry.new("Wednesday 9th March 2022","one " * 400)
       diary.count_words
       expect(diary.reading_time(200)).to eq 2
    end

  end

  context "returns the estimated reading time in minutes given a string between 400 and up to 600 words" do

    it "given a string with 500 words it returns 3" do
       diary = DiaryEntry.new("Wednesday 9th March 2022","one " * 500)
       diary.count_words
      expect(diary.reading_time(200)).to eq 3
    end
   
  end


 it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
  diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
  diary.count_words
  expect(diary.reading_chunk(2, 1)).to eq "one two"
end

it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
  diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
  diary.count_words
  diary.reading_chunk(2, 1)
  expect(diary.reading_chunk(2, 1)).to eq "three four"
end

it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
  diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
  diary.count_words
  diary.reading_chunk(2, 1)
  diary.reading_chunk(2, 1)
  expect(diary.reading_chunk(2, 1)).to eq "five"
end



end