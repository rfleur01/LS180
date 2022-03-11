# Ruby
array = Array(1..12)
a = 0
idx = 0
while a < 7
  if array[idx] % 2 ==0
    a += array[idx]
  end
  idx += 1
end
puts "#{a}, #{idx}"