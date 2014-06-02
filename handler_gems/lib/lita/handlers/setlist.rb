require 'nokogiri'
require 'open-uri'
require 'uri'

module Lita
    module Handlers
        # Uses a band's recent performance setlists to generate a list of songs that
        # more or less predicts the setlist of their next performance. Returns a link
        # to a Spotify widget that lists the songs.
        #
        # Use case: I might go to a concert tonight, I don't know their music. I want
        # to check out the songs I'm likely to hear tonight.
        #
        # Example:
        #     /setlist Red Hot Chili Peppers
        class Setlist < Handler
            route (/^\/setlist\s+(.+)/), :setlist, help: {
                "/setlist" => "Predicts a setlist for a band's next show based on their recent performances"
            }

            BASE_URI = "http://daves-music-thing.herokuapp.com"

            def setlist(response)
                artistName = response.matches.join("+")
                artistName = URI.encode(artistName)

                link = get_spotify_setlist_uri(artistName)

                response.reply(link)
            end

            def get_spotify_setlist_uri(artistName)
                query_uri = BASE_URI + "/setlist/embed?artistName=" + artistName

                begin
                    return open(query_uri).read
                rescue OpenURI::HTTPError => e
                    return "Dave needs to do a better job"
                else
                    return "I don't wanna"
                end
            end

            Lita.register_handler(Setlist)
        end
    end
end
