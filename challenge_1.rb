plans = [
  { name: '沖縄旅行', price: 10_000 },
  { name: '北海道旅行', price: 20_000 },
  { name: '九州旅行', price: 15_000 }
]
puts <<~TEXT
  旅行プランを選択して下さい。

TEXT
plans.each.with_index(1) do |plan, i|
  puts "#{i}. #{plan[:name]} (#{plan[:price]}円)"
end

while true
  print 'プランの番号を選択 > '
  select_plan_num = gets.to_i
  break if (1..3).include?(select_plan_num)

  puts '1〜3の番号を入力してください。'
end
chosen_plan = plans[select_plan_num - 1]

puts <<~TEXT
  #{chosen_plan[:name]}ですね。
  何名で予約されますか？
TEXT

while true
  print '人数を入力 > '
  number_of_reservation = gets.to_i
  break if number_of_reservation >= 1

  puts '1以上を入力してください。'
end
puts "#{number_of_reservation}名ですね。"

total_price = number_of_reservation * chosen_plan[:price]
if number_of_reservation >= 5
  total_price *= 0.9
  puts '5名以上ですので10%割引となります。'
end
puts "合計料金は#{total_price.floor}円となります。"
