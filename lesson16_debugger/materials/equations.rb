# Метод, выводящий решение на экран
require 'byebug'

def print_root(x_real, x_complex)
  puts 'Solution:'
  print x_real
  print ' +' if x_complex > 0
  print " #{x_complex} * i" if x_complex != 0
  puts
end

puts 'Solve equation: A * x^2 + B * x + C = 0'

puts 'Enter A:'
a = gets.to_f

puts 'Enter B:'
b = gets.to_f

puts 'Enter C:'
c = gets.to_f

if a == 0
  abort "It is linear equation! x = #{-c/b}"
end

# считаем дискриминант
discr = b*b - 4*a*c;

byebug

if discr < 0 # комплексные числа пошли

  x1_real = -b/(2*a)
  x1_complex = Math::sqrt(-discr)/(2*a)

  x2_real = -b/(2*a)
  x2_complex = -Math::sqrt(-discr)/(2*a)

else
  # первый корень
  x1_real = (-b + Math::sqrt(discr))/(2*a)
  x1_complex = 0

  # второй корень
  x2_real = (-b - Math::sqrt(discr))/(2*a)
  x2_complex = 0
end

print_root(x1_real, x1_complex)
print_root(x2_real, x2_complex)

