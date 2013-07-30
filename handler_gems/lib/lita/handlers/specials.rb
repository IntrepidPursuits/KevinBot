module Lita
  module Handlers
    class Hello < Handler
      route /^specials/, :list_specials, command: true
      
      def list_specials(response)
        response.reply('These are the specials:')
      end
    end
    Lita.register_handler(Hello)
  end
end
