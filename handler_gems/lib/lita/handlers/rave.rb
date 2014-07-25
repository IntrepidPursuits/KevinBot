module Lita
    module Handlers
        class Rave < Handler
            route (/^\$(rave).?/), :rave, help: {
                "/rave" => "Par-tay."
            }

        def rave(response)
          # prev_color = random_color
          # response.reply(prev_color)

          # 10.times do
          #   sleep(0.5)
          #   new_color = random_color
          #   response.reply("/s/#{prev_color}/#{new_color}")
          #   prev_color = new_color
          # end

          response.reply('http://i.imgur.com/ZT8S42H.png')
        end

        def random_color
          '#' + '%06x' % (rand * 0xffffff)
        end

        Lita.register_handler(Rave)
        end
    end
end
