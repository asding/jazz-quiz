modes = {0 => 'Ionian',
         1 => 'Dorian',
         2 => 'Phrygian',
         3 => 'Lydian',
         4 => 'Mixolydian',
         5 => 'Aeolian',
         6 => 'Locrian'}

mode_semitones = {0 => 0,
                  1 => 2,
                  2 => 4,
                  3 => 5,
                  4 => 7,
                  5 => 9,
                  6 => 11}

keys = {0 => 'C',
        1 => 'Db',
        2 => 'D',
        3 => 'Eb',
        4 => 'E',
        5 => 'F',
        6 => 'F#/Gb',
        7 => 'G',
        8 => 'Ab',
        9 => 'A',
        10 => 'Bb',
        11 => 'B'}

intervals = {0 => ['Perfect Unison', 'Diminished 2nd'],
             1 => ['Augmented Unison', 'Minor 2nd'],
             2 => ['Major 2nd', 'Diminished 3rd'],
             3 => ['Augmented 2nd', 'Minor 3rd'],
             4 => ['Major 3rd', 'Diminished 4th'],
             5 => ['Augmented 3rd', 'Perfect 4th'],
             6 => ['Augmented 4th', 'Diminished 5th', 'Tritone'],
             7 => ['Perfect 5th', 'Diminished 6th'],
             8 => ['Augmented 5th', 'Minor 6th'],
             9 => ['Major 6th', 'Diminished 7th'],
             10 => ['Augmented 6th', 'Minor 7th'],
             11 => ['Major 7th', 'Diminished Octave']}

major_scale = [0, 2, 4]
begin
  k_idx = rand(0..11)
  m_idx = rand(0..6)
  key = keys[k_idx]
  mode = modes[m_idx]
  
  puts
  puts "----------------------------------------------------------------"
  puts "Q: Which ionian scale has exactly the same keys as of:"
  puts "    #{key} #{mode}?"
  gets
  equivalent_ionian = keys[(k_idx + 12 - mode_semitones[m_idx])%12]
  puts "A: Its #{equivalent_ionian}!"
  puts
  
  sleep 0.5
end while true
