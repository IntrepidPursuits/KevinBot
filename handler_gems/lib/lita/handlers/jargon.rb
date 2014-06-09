module Lita
    module Handlers
        class Jargon < Handler
            route (/^\$(jargon).?/), :jargon, help: {
                "/jargon" => "Generates nonsense"
            }

        def jargon(response)

            abbreviations = ['TCP', 'HTTP', 'SDD', 'RAM', 'GB', 'CSS', 'SSL', 'AGP', 'SQL', 'FTP', 'PCI', 'AI', 'ADP', 'RSS', 'XML', 'EXE', 'COM', 'HDD', 'THX', 'SMTP', 'SMS', 'USB', 'PNG', 'HTML', 'SCI', 'NASDAQ', 'CAPTCHA', 'SIM', 'CORE', 'JSON', 'GNU', 'ASP', 'BBC', 'USA', 'PIN', 'ACL', 'ANSI', 'GUI', 'GUID', 'HDMI', 'I/O', 'IMAP', 'MAMP', 'CD-ROM', 'CMS', 'PRAM', 'DSL', 'FIFO', 'CHUD', 'IDE', 'TWAT', 'VCR', 'P2P', 'SATA', 'SDK', 'TTL', 'ISP', 'WAP', 'LAN', 'RF', 'LTE']
            adjectives = ['auxiliary', 'primary', 'back-end', 'digital', 'open-source', 'virtual', 'cross-platform', 'redundant', 'online', 'haptic', 'multi-byte', 'bluetooth', 'wireless', '1080p', 'neural', 'optical', 'solid state', 'mobile', 'outdated', 'encrypted', 'Canadian', 'integral', 'sciency', 'recalled', 'industrial', 'backed up', 'sub-zero', 'secondary', 'secured', 'scrambled', 'electronic', 'wireless', 'rerouted', 'solar-powered', 'vectorized', 'prioritized', 'triangulated']
            nouns = ['driver', 'protocol', 'bandwidth', 'panel', 'microchip', 'program', 'port', 'card', 'array', 'interface', 'system', 'sensor', 'firewall', 'hard drive', 'pixel', 'alarm', 'feed', 'monitor', 'application', 'transmitter', 'bus', 'circuit', 'capacitor', 'matrix', 'transistor', 'flux-capacitor', 'motherboard', 'satellite', 'signal', 'neural network', 'executable', 'drive', 'device', 'program', 'port', 'emulator', 'virtualizer', 'commit', 'application', 'bit-stream']
            ing_verbs = ['backing up', 'bypassing', 'hacking', 'overriding', 'compressing', 'copying', 'navigating', 'indexing', 'connecting', 'generating', 'quantifying', 'calculating', 'synthesizing', 'transmitting', 'programming', 'parsing', 'streaming', 'compliling', 'formulating', 'inputting', 'encrypting', 'decrypting', 'bit-shifting', 'encoding', 'routing', 'downloading', 'uploading', 'fact-checking', 'parsing', 'matrisizing', 'formatting', 'rotating', 'serializing']
            verbs = ['back up', 'bypass', 'hack', 'override', 'compress', 'copy', 'navigate', 'index', 'connect', 'generate', 'quantify', 'calculate', 'synthesize', 'input', 'transmit', 'program', 'reboot', 'parse', 'stream', 'compile', 'formulate', 'input', 'encrypt', 'decrypt', 'bit-shift', 'encode', 'route', 'download', 'upload', 'fact-check', 'parse', 'rotate', 'format', 'serialize', 'emulate']

            constructs = [
                "If we #{verbs.sample} the #{nouns.sample}, we can get to the #{abbreviations.sample} #{nouns.sample} through the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "We need to #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "Try to #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}, maybe it will #{verbs.sample} the #{adjectives.sample} #{nouns.sample}!",
                "You can't #{verbs.sample} the #{nouns.sample} without #{ing_verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "Use the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}, then you can #{verbs.sample} the #{adjectives.sample} #{nouns.sample}!",
                "The #{abbreviations.sample} #{nouns.sample} is down, #{verbs.sample} the #{adjectives.sample} #{nouns.sample} so we can #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}!",
                "#{ing_verbs.sample.capitalize} the #{nouns.sample} won't do anything, we need to #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}!",
                "I'll #{verbs.sample} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample}, that should #{verbs.sample} the #{abbreviations.sample} #{nouns.sample}!",
                "Quick! #{verbs.sample.capitalize} the #{adjectives.sample} #{abbreviations.sample} #{nouns.sample} before the #{ing_verbs.sample} #{abbreviations.sample} #{nouns.sample} starts #{ing_verbs.sample}!",
                "We have to create a #{ing_verbs.sample} #{nouns.sample} or we can't #{verbs.sample} the #{adjectives.sample} #{nouns.sample}."
            ]

            response.reply(constructs.sample)
        end

        Lita.register_handler(Jargon)
        end
    end
end
