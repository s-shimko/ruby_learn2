require 'rspec'
require_relative 'sklonjator.rb'

describe 'Sklonjator' do


  it 'should do ok for KROKODILOV' do
    expect(Sklonjator.sklonenie(5, 'krokodil', 'krokodila', 'krokodilov')).to eq('krokodilov')
  end

  it 'should do ok for KROKODILOV _ automated' do
    [5, 6, 7, 8, 9, 0].each do |number|

      (0..100).step(10) do |i|
        summa = i + number
        expect("#{Sklonjator.sklonenie(summa, 'krokodil', 'krokodila', 'krokodilov', true)}").to eq("#{summa} krokodilov")
      end
    end
  end

end