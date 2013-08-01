module Lita
  module Handlers
    class TestingDM < Handler
      route /^dm.?/, :direct_message
      
      def direct_message(response)
        robot.send_messages(Lita::Source.new(response.user), 'hello world')
      end
    end
    Lita.register_handler(TestingDM)
  end
end
