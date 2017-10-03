# coding: utf-8
# all these are defined in relative semitones to C
def keys
  {0 => ['C'],
   1 => ['C♯', 'D♭'],
   2 => ['D'],
   3 => ['D♯', 'E♭'],
   4 => ['E'],
   5 => ['F'],
   6 => ['F♯', 'G♭'],
   7 => ['G'],
   8 => ['G♯', 'A♭'],
   9 => ['A'],
   10 => ['A♯', 'B♭'],
   11 => ['B']}
end
def intervals
  {0 => ['Perfect Unison', 'Diminished 2nd'],
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
   11 => ['Major 7th', 'Diminished Octave'],
   14 => ['Major 9th'],
   17 => ['Major 11th'],
   21 => ['Major 13th']}
end
def modes
  {0 => ['Ionian'],
   2 => ['Dorian'],
   4 => ['Phrygian'],
   5 => ['Lydian'],
   7 => ['Mixolydian'],
   9 => ['Aeolian'],
   11 => ['Locrian']}
end
def ionian_scale # i.e major scale
  [0, 2, 4, 5, 7, 9, 11]
end
def self.scale_in_mode(mode)
  scale_index = a.index(semitones_inference(modes)[mode])
  mode_scale = loop_array(ionian_scale, scale_index)
  increment_array_and_modulo(mode_scale, -mode_scale.first, 12)
end

