require './lib/practice.rb'

note = Note.new("hello", "hello friend")
# this gets the instance variable that the noteformatter object gets assigned to at initialisation
formatter = note.instance_variable_get(:@formatter)
# this prints the resulting note when it is formatted by the dependency injected object does it's thing
puts formatter.format(note)


# puts an entry into the diary entries variable
diary = Diary.new(Entry)
puts diary.inspect
diary.add("title", "body")
diary.add("another title", "some more text")
puts diary.inspect
puts diary.index
