# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая поздравляет с днём рождения

# Код для поддержки русских букв в консоли
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

def happy_birthday(person)
  puts "*  *  *"
  puts
  puts "Дорогой #{person[:name]}"
  puts
  puts "Поздравляем Вас с днём рождения! Вам сегодня исполняется #{person[:age]}"
  puts
  puts "Желаем #{person[:wishes]}!"
  puts
end

happy_birthday({name: 'Виталий', age: '5', wishes: 'никого не обижать в детском садике'})
happy_birthday({name: 'Борис', age: '48', wishes: 'успехов в лечении простатита'})
happy_birthday({name: 'Лариса', age: '35', wishes: 'выглядеть как ягодка опять'})
