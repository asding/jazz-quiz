class Modes < Questions::Interface
  ################ questions
  def self.questions
    [:mode_root]
  end
  def self.question
    send(questions.sample)
  end
  def self.mode_root
    k_idx, m_idx = keys.keys.sample, modes.keys.sample
    key, mode = keys[k_idx].sample, modes[m_idx].sample
    puts "--------------------------------"
    puts "MODES - find the root of a mode"
    puts "--------------------------------"
    puts "===> Q: Find the equivalent ionian mode (major scale) root key of:"
    puts "  #{[key, mode].join('  ')}"
    gets
    root = keys[(k_idx - m_idx)%12].join("/")
    puts "===> A: #{root}"
    puts
  end
end
