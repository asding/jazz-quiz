require_relative 'functions.rb'
require_relative 'knowledge.rb'
require_relative 'questions.rb'
Dir[File.join(__dir__, 'questions/*.rb')].each { |f| require f }
$rand = Random.new

puts "================================================================"
puts "                      JAZZ MUSIC THEORY QUIZ"
puts "================================================================"
puts

$continue = true
begin
  resume = Questions.ask
  sleep 0.5
end while $continue
puts
puts "================================================================"
puts "Hope I have helped your revisions in jazz theories, see ya soon!"
