Factory.define(:topic) do |f|
  f.title "Title #{Time.now}"
  f.description "Some awesome topic that we'll discuss in depth"
end

# :complete_topic includes an entry for all available fields. 
Factory.define(:complete_topic, :parent => 'topic') do |f|
  f.suggestor "Bob"
end
