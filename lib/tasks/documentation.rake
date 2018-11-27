# Generates the Yard documentation
YARD::Rake::YardocTask.new do |t|
  t.files = ['app.rb', '**/lib/**/*.rb', '**/helpers/*.rb', '**/routing/*.rb', '**/models/*.rb']
  t.options = ['--protected', '--private']
end