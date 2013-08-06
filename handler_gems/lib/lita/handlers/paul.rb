module Lita
  module Handlers
    class Paul < Handler
      route (/.?/), :paul

      def paul(response)
        if rand < 0.001 # One in every 1000
          response.reply("shut up paul")
        end
      end
      Lita.register_handler(Paul)
    end
  end
end
