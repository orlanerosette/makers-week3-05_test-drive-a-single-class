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



end