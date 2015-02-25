
asdf = []
secret = "RRGB"
secret = secret.chars
input = "FFRR"

secret.count do |color|
  input.chars.each do |c|
   asdf << color == c
 end
end

print asdf
