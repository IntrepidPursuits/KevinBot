module Lita
  module Handlers
    class Paul < Handler
      route (/.?/), :paul

      def paul(response)
        if rand < (1/1000.0)
          response.reply("shut up paul")
        else
          response.reply(rand)
        end
      end
      Lita.register_handler(Paul)
    end
  end
end
