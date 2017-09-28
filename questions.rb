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
  end
end
