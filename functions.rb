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
def increment_array_and_modulo(array, increment, modulo)
  array.map { |i| (i + increment) % modulo }
end
