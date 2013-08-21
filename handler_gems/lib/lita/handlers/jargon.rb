module Lita
    module Handlers
        class Jargon < Handler
            route (/^\/(jargon).?/), :jargon, help: {
                "/jargon" => "Generates nonsense"
            }

        def jargon(response)

            abbreviations = ["TCP", "HTTP", "SDD", "RAM", "GB", "CSS", "SSL", "AGP", "SQL", "FTP", "PCI", "AI", "ADP", "RSS", "XML", "EXE", "COM", "HDD", "THX", "SMTP", "SMS", "USB", "PNG"]
            adjectives = ["auxiliary", "primary", "back-end", "digital", "open-source", "virtual", "cross-platform", "redundant", "online", "haptic", "multi-byte", "bluetooth", "wireless", "1080p", "neural", "optical", "solid state", "mobile"]
            nouns = ["driver", "protocol", "bandwidth", "panel", "microchip", "program", "port", "card", "array", "interface", "system", "sensor", "firewall", "hard drive", "pixel", "alarm", "feed", "monitor", "application", "transmitter", "bus", "circuit", "capacitor", "matrix"]
            ingVerbs = ["backing up", "bypassing", "hacking", "overriding", "compressing", "copying", "navigating", "indexing", "connecting", "generating", "quantifying", "calculating", "synthesizing", "transmitting", "programming", "parsing"]
            verbs = ["back up", "bypass", "hack", "override", "compress", "copy", "navigate", "index", "connect", "generate", "quantify", "calculate", "synthesize", "input", "transmit", "program", "reboot", "parse"]
            
            constructs = [
                "If we #{verbs.sample} the #{nouns.sample}, we can get to the #{abbreviations.sample} #{nouns.sample} through the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "We need to #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "Try to #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}, maybe it will #{verbs.sample} the #{adjectives.sample} #{nouns.sample}!",
                "You can't #{verbs.sample} the #{nouns.sample} without #{ingVerbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "Use the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}, then you can #{verbs.sample} the #{adjectives.sample} #{nouns.sample}!",
                "The #{abbreviations.sample} #{nouns.sample} is down, #{verbs.sample} the #{adjectives.sample} #{nouns.sample} so we can #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}!",
                "#{ingVerbs.sample} the #{nouns.sample} won't do anything, we need to #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "I'll #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}, that should #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}!",
            ]

            response.reply(constructs.sample)
        end

        Lita.register_handler(Jargon)
        end
    end 
end