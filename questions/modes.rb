class Modes < Questions::Interface
  ################ questions
  def self.questions
    [:mode_root]
  end
  def self.question
    send(questions.sample)
  end
  def self.mode_root
    k_idx, m_idx = KEYS.keys.sample, MODES.keys.sample
    key, mode = KEYS[k_idx].sample, MODES[m_idx].sample
    puts "--------------------------------"
    puts "MODES - find the root of a mode"
    puts "--------------------------------"
    puts "===> Q: Find the equivalent ionian mode (major scale) root key of:"
    puts "  #{[key, mode].join('  ')}"
    gets
    root = KEYS[(k_idx - m_idx)%12].join("/")
    puts "===> A: #{root}"
    puts
  end
end
