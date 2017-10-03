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
    [:"7th", :'9th', :'11th', :'13th']
  end

  # main constructor
  def self.chord_notes_of_mode(key, mode, inversion: 0)
    k_idx = semitones_inference(KEYS)[key].first
    scale_notes = scale_in_mode(mode).map { |i| KEYS[(k_idx + i) % 12] }
    # TODO: implement inversions
    scale_notes.select.with_index { |_, i| i.even? } +
      scale_notes.select.with_index { |_, i| i.odd? }
  end
  
  # mode of chords
  def self._major(key)
    chord_notes_of_mode(key, 'Ionian')
  end
  def self._minor(key)
    chord_notes_of_mode(key, 'Aeolian')
  end
  def self._dominant(key)
    chord_notes_of_mode(key, 'Mixolydian')
  end
  
  # degree of chords
  def self._7th(chord)
    chord[0..3]
  end
  def self._9th(chord)
    chord[0..4]
  end
  def self._11th(chord)
    chord[0..5]
  end
  def self._13th(chord)
    chord[0..6]
  end
end
