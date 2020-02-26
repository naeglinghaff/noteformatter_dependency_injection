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
