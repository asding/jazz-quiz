require_relative 'knowledge.rb'
require_relative 'questions.rb'
Dir[File.join(__dir__, 'questions/*.rb')].each { |f| require f }
$rand = Random.new

puts "================================================================"
puts "                      JAZZ MUSIC THEORY QUIZ"
puts "================================================================"
puts

begin
  Questions.ask
  sleep 0.5
end while true
