input = input.chars
key= ["R", "Y", "B","G"]


input.each do |letter|
  key.include?(letter)
end
