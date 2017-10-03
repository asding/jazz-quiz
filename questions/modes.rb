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
    title "MODES - find the root of a mode"
    prompt ["Find the equivalent ionian mode (major scale) root key of:",
            "#{[key, mode].join('  ')}"]
    answer KEYS[(k_idx - m_idx)%12].join("/")
  end
end
