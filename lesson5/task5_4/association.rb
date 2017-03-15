products = {
    drink: "Coca-cola",
    eat: "Snacks"
}

hoz = {
    instrument: "Wrench",
    glue: "Moment"
}

combine = products.merge(hoz)

combine.each do |x,i|
  puts "#{x}:  #{i}"
end



