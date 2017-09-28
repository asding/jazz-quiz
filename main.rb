require 'knowledge.rb'
require 'questions.rb'
Dir[File.join(__dir__, 'questions/*.rb')].each { |f| require f }
$rand = Random.new

puts "================================================================"
puts "                      JAZZ MUSIC THEORY QUIZ"
puts "================================================================"

begin
  # TODO:
  sleep 0.5
end while true
