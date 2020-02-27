require 'practice'

describe Note do
  # this checks that note has been initialized properly
  it 'should have a title and a body' do
    @note = Note.new("hello", "hello friend")
    expect(@note.title).to eq("hello")
    expect(@note.body).to eq("hello friend")
  end

  describe '#display' do
  # here we are using a double to make sure that the noteformatter and the note are both working as expected and it can be taken as a parameter
  it 'displays a note with a double' do
    # what is the double called, double, the name of the object class, the method you want it to simulate and the result you expect it to get
    @formatter = double :noteformatter, format: "Title: hello\nhello friend"
    # new note that will use the formatter, and accepts it at creation as expected when we run the real program(we're cheating and setting it up in advance for the sake of the test)
    @note = Note.new("hello", "hello friend", @formatter)
    # what we think it should do now...
    expect(@formatter.format(@note)).to eq("Title: #{@note.title}\n#{@note.body}")
  end
end
end

describe Entry do
  let (:entry)  { Entry.new("title", "body") }
  it '#initialize should create a title and a body' do
    expect(entry.title).to eq("title")
    expect(entry.body).to eq("body")
  end
end

describe Diary do
  let(:entry) {Entry.new("title", "body")}
  let(:diary) {Diary.new(Entry)}

  describe '#initialize' do

    it 'should have an empty array and entry_class' do
      expect(diary.entry_class).to eq Entry
    end

    it 'should create an empty array' do
      expect(diary.entries).to eq []
    end
  end

  describe '#add' do

    it { is_expected.to respond_to(:add).with(2).argument }

    it '#add should add an entry to the entries array' do
      diary.add("title", "body")
      expect(diary.entries.count).to eq 1
    end

    it '#add should add extra entries to the @entries array' do
      diary.add("title", "body")
      diary.add("another title", "another text")
      expect(diary.entries.count).to eq 2
    end
  end

end
