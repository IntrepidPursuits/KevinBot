Dir.glob('handler_gems/lib/lita/handlers/*').each do |file|
  load(file)
end