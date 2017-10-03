class Questions
  class << self
    attr_accessor :pool
  end
  def self.pool
    @pool ||= []
  end
  def self.inherited(subclass)
    self.pool << subclass
  end
  def self.ask
    self.pool.sample.question
  end

  class Interface
    def self.inherited(subclass)
      Questions.pool << subclass
    end
    def self.question
      raise NotImplementedError
    end
    def self.title(header)
      puts "--------------------------------"
      puts header
      puts "--------------------------------"
    end
    def self.prompt(lines)
      lines.each.with_index do |line, i|
        prefix = i == 0 ? "===> Question: " : "  "
        puts "#{prefix}#{line}"
      end
    end
    def self.answer(this)
      puts
      puts "===> Response: press [q] to quit, [ENTER] to continue..."
      print "  "
      input = gets.chomp
      $continue = false if input == 'q'
      puts
      puts "===> Answer: "
      puts "  #{this}"
      puts
    end
  end
end
