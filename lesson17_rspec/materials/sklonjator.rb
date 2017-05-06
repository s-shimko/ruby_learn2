class Sklonjator

  # когда нужно его использовать с числом
  # Например во фразах, типа "1 крокодил, 23 крокодила, 7 крокодилов"
  def self.sklonenie(number, krokodil, krokodila, krokodilov, with_number = false)
    # проверим входные данные на правильность
    if (number == nil || !number.is_a?(Numeric))
      number = 0 # если первый параметр пустой или не число, то продолжаем как будто он нулевой
    end

    prefix = ""
    prefix = "#{number} " if with_number

    ostatok = number % 10 # склонение определяется последней цифрой в числе

    ostatok100 = number % 100
    if (ostatok100 >= 11 && ostatok100 <= 14)
      return "#{prefix}#{krokodilov}"
    end


    if (ostatok == 1) # для 1 - именительный падеж (Кто? Что?)
      return "#{prefix}#{krokodil}"
    end

    if (ostatok >= 2 && ostatok <= 4) # для 2-4 - родительный падеж (Кого? Чего?)
      return "#{prefix}#{krokodila}"
    end

    # 5-9 или ноль – родительный падеж и множественное число
    if (ostatok >= 5 && ostatok <= 9 || ostatok == 0)
      return "#{prefix}#{krokodilov}"
    end
  end
end

