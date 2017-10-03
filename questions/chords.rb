class Chords < Questions::Interface
  ################ questions
  def self.questions
    [:notes_in_chords]
  end
  def self.question
    send(questions.sample)
  end

  def self.notes_in_chords
    key, mode, degree = KEYS[KEYS.keys.sample].sample, chord_modes.sample, chord_degrees.sample
    title "CHORDS - notes of chords given key"
    prompt ["Find notes in the chords of:",
            "#{[key + ' ', mode, degree].map(&:capitalize).join(' ')}"]
    answer send("_#{degree}", send("_#{mode}", key)).map { |e| e.join('/') }.join('  ')
  end

  private

  # registrars
  def self.chord_modes
    [:major, :minor, :dominant]
  end  
  def self.chord_degrees
    [:seventh, :ninth, :eleventh, :thirteenth]
  end

  # main constructor
  def self.chord_notes_of_mode(key, mode, inversion: 0)
    k_idx = semitones_inference(KEYS)[key.sample].first
    scale_notes = scale_in_mode(mode).map { |i| KEYS[(k_idx + i) % 12] }
    # TODO: implement inversions
    scale_notes.select.with_index { |_, i| i.even? } +
      scale_notes.select.with_index { |_, i| i.odd? }
  end
  
  # mode of chords
  def self.major(key)
    chord_notes_of_mode(key, 'Ionian')
  end
  def self.minor(key)
    chord_notes_of_mode(key, 'Aeolian')
  end
  def self.dominant(key)
    chord_notes_of_mode(key, 'Mixolydian')
  end
  
  # degree of chords
  def self.seventh(chord)
    chord[0..3]
  end
  def self.ninth(chord)
    chord[0..4]
  end
  def self.eleventh(chord)
    chord[0..5]
  end
  def self.thirteenth(chord)
    chord[0..6]
  end
end
