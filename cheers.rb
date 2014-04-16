puts "What's your name?"
name = gets.chomp.upcase
ans = 'AEFHILMNORSX'
name.each_char do |character|
  if ans.include?character
    puts "Give me an... " + character
  else
    puts "Give me a.... " + character
  end
end
puts name + "'s just GRAND!"
