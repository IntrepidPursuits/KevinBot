module Lita
  module Handlers
    class ThatsTheJoke < Handler
      route (/.?(thatsthejoke.jpg).?/), :thatsthejoke
      
      def thatsthejoke(response)
        response.reply("http://imgur.com/wAUhBYo")
      end
      
      Lita.register_handler(ThatsTheJoke)
    end
  end
end
