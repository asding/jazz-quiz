def semitones_inference(knowledge_hash)
  inverse = {}
  knowledge_hash.each do |key, values|
    values.each do |value|
      if inverse[value]
        inverse[value] << key
      else
        inverse[value] = [key]
      end
    end
  end
  inverse
end
def loop_array(array, index)
  raise ArgumentError, 'array index out of range' unless array[index]
  array[index, (array.length - index)] + array[0, index]
end
def normalise_array_with_ascending_modulo(array, modulo) # make first element 0, mod the rest with modulo
  diff = array.first
  array.map { |i| (i - diff + modulo) % modulo }
end
