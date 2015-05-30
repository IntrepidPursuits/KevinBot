# kevinbot 2.0

This is kevinbot. He is the chatbot at Intrepid.

## Start

`ruby kevinbot.rb`

## Make a new command

### Create a new class named the same as your command inheriting from `BaseCommand`. For example, if your command is `/mycoolcommand`:

###### commands/mycoolcommand.rb
```ruby
class Mycoolcommand < BaseCommand
  #...
end
```

### Craft your response to Slack in the `perform` method:

###### commands/mycoolcommand.rb
```ruby
class Mycoolcommand < BaseCommand
  def perform
    text = 'Look how cool this is'
  end
end
```

### Send it back to Slack with the `respond` method:

###### commands/mycoolcommand.rb
```ruby
class Mycoolcommand < BaseCommand
  def perform
    text = 'Look how cool this is'

    respond(text)
  end
end
```

### Make a new slash command on [Slack](https://intrepid.slack.com/services/new/slash-commands) with these settings:

| Field   | Value                              |
|:--------|:-----------------------------------|
| Command | `/rave`                            |
| URL     | `https://kevinbot2.herokuapp.com/` |
| Method  | **POST**                           |
