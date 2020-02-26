require './lib/practice.rb'

note = Note.new("hello", "hello friend")
# this gets the instance variable that the noteformatter object gets assigned to at initialisation
formatter = note.instance_variable_get(:@formatter)
# this prints the resulting note when it is formatted by the dependency injected object does it's thing
puts formatter.format(note)
