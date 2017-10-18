def stock_picker(prices)
  max_diff = 0
  best_buy = prices.max
  buy = 0
  sell = 0
  
  
  stocks = prices.length - 1
  
  (0..stocks).each { |i| 
    
    if prices[i] < best_buy
      best_buy = prices[i]
      
      (i..stocks).each { |j| 
        
        if (prices[j] - prices[i]) > max_diff
          max_diff = prices[j] - best_buy
          buy = i
          sell = j
          @buy_price = prices[i]
          @sell_price = prices[j]
          end
    } 
  end
  }
  
  puts "[#{buy},#{sell}]"
  
  puts "You should purchase on day #{buy} and sell on day #{sell}"
  puts "Your total profit will be #{max_diff} if you buy for #{@buy_price} and sell for #{@sell_price}"
end

stock_picker([17,3,6,9,15,8,6,1,10])

##### A more idiomatic way to program this #####

def stock_picker(prices)
 ((0...prices.length).to_a)
 .repeated_permutation(2)
 .select { |start, finish| finish > start }
 .max_by { |start, finish| prices[finish] - prices[start]}
end