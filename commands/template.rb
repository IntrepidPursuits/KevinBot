# The command should be in a file named with snake_case. the class name should match using CamelCase.
# e.g. my_cool_command.rb & MyCoolCommand.
# It also needs to inherit from BaseCommand.
# The main method for your class is called perform.
# To send a message back to slack, use the respond method and pass the text in.

class Template < BaseCommand
  def perform
    text = 'hello'

    respond(text)
  end
end
