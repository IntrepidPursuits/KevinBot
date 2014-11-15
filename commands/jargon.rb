class Jargon < BaseCommand
  def perform
    respond(jargon)
  end

  def jargon
    ["If we #{verb} the #{noun}, we can get to the #{abbreviation} #{noun} through the #{adjective} #{abbreviation} #{noun}!",
     "We need to #{verb} the #{adjective} #{abbreviation} #{noun}!",
     "Try to #{verb} the #{abbreviation} #{noun}, maybe it will #{verb} the #{adjective} #{noun}!",
     "You can't #{verb} the #{noun} without #{ing_verb} the #{adjective} #{abbreviation} #{noun}!",
     "Use the #{adjective} #{abbreviation} #{noun}, then you can #{verb} the #{adjective} #{noun}!",
     "The #{abbreviation} #{noun} is down, #{verb} the #{adjective} #{noun} so we can #{verb} the #{abbreviation} #{noun}!",
     "#{ing_verb.capitalize} the #{noun} won't do anything, we need to #{verb} the #{adjective} #{abbreviation} #{noun}!",
     "I'll #{verb} the #{adjective} #{abbreviation} #{noun}, that should #{verb} the #{abbreviation} #{noun}!",
     "Quick! #{verb.capitalize} the #{adjective} #{abbreviation} #{noun} before the #{ing_verb} #{abbreviation} #{noun} starts #{ing_verb}!",
     "We have to create a #{ing_verb} #{noun} or we can't #{verb} the #{adjective} #{noun}."].sample
  end

  def abbreviation
    ['TCP', 'HTTP', 'SDD', 'RAM', 'GB', 'CSS', 'SSL', 'AGP', 'SQL', 'FTP', 'PCI', 'AI', 'ADP', 'RSS', 'XML', 'EXE', 'COM', 'HDD', 'THX', 'SMTP', 'SMS', 'USB', 'PNG', 'HTML', 'SCI', 'NASDAQ', 'CAPTCHA', 'SIM', 'CORE', 'JSON', 'GNU', 'ASP', 'BBC', 'USA', 'PIN', 'ACL', 'ANSI', 'GUI', 'GUID', 'HDMI', 'I/O', 'IMAP', 'MAMP', 'CD-ROM', 'CMS', 'PRAM', 'DSL', 'FIFO', 'CHUD', 'IDE', 'VCR', 'P2P', 'SATA', 'SDK', 'TTL', 'ISP', 'WAP', 'LAN', 'RF', 'LTE', 'GSM', 'SMPTE'].sample
  end

  def adjective
    ['auxiliary', 'primary', 'back-end', 'digital', 'open-source', 'virtual', 'cross-platform', 'redundant', 'online', 'haptic', 'multi-byte', 'bluetooth', 'wireless', '1080p', 'neural', 'optical', 'solid state', 'mobile', 'outdated', 'encrypted', 'Canadian', 'integral', 'sciency', 'recalled', 'industrial', 'backed up', 'sub-zero', 'secondary', 'secured', 'scrambled', 'electronic', 'wireless', 'rerouted', 'solar-powered', 'vectorized', 'prioritized', 'triangulated'].sample
  end

  def noun
    ['driver', 'protocol', 'bandwidth', 'panel', 'microchip', 'program', 'port', 'card', 'array', 'interface', 'system', 'sensor', 'firewall', 'hard drive', 'pixel', 'alarm', 'feed', 'monitor', 'application', 'transmitter', 'bus', 'circuit', 'capacitor', 'matrix', 'transistor', 'flux-capacitor', 'motherboard', 'satellite', 'signal', 'neural network', 'executable', 'drive', 'device', 'program', 'port', 'emulator', 'virtualizer', 'commit', 'application', 'bit-stream'].sample
  end

  def ing_verb
    ['backing up', 'bypassing', 'hacking', 'overriding', 'compressing', 'copying', 'navigating', 'indexing', 'connecting', 'generating', 'quantifying', 'calculating', 'synthesizing', 'transmitting', 'programming', 'parsing', 'streaming', 'compliling', 'formulating', 'inputting', 'encrypting', 'decrypting', 'bit-shifting', 'encoding', 'routing', 'downloading', 'uploading', 'fact-checking', 'parsing', 'matrisizing', 'formatting', 'rotating', 'serializing'].sample
  end

  def verb
    ['back up', 'bypass', 'hack', 'override', 'compress', 'copy', 'navigate', 'index', 'connect', 'generate', 'quantify', 'calculate', 'synthesize', 'input', 'transmit', 'program', 'reboot', 'parse', 'stream', 'compile', 'formulate', 'input', 'encrypt', 'decrypt', 'bit-shift', 'encode', 'route', 'download', 'upload', 'fact-check', 'parse', 'rotate', 'format', 'serialize', 'emulate'].sample
  end
end
