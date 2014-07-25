module Lita
  module Handlers
    class ThatsTheJoke < Handler
      route (/.?(thatsthejoke.jpg).?/), :thatsthejoke

      def thatsthejoke(response)
        response.reply('http://i.imgur.com/wAUhBYo.jpg')
      end

      Lita.register_handler(ThatsTheJoke)
    end
  end
end
