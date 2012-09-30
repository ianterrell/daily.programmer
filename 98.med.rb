#!/usr/bin/env ruby

#Write a function that takes two arguments: a limit, lim, and a list of 
#integers, x. The function counts up from 0 by cycling through x and skipping 
#numbers until we find the next number that's a multiple of x[i]. For example,
#when x is the list [5, 7, 3], start counting from 0:

#Next multiple of 5 is 5
#Next multiple of 7 is 7
#Next multiple of 3 is 9
#Next multiple of 5 is 10
#Next multiple of 7 is 14
#Next multiple of 3 is 15

#When the count reaches lim or a number above it, return the number of steps 
#it took to reach it. (multiple_cycle(15, [5, 7, 3]) would return 6.)

#What is the result of multiple_count(1000000000, [5395, 7168, 2367, 9999, 3])?

require 'benchmark'

def multiple_count(lim, ints)
  cnt = 0
  cyc = ints.cycle
  current_mod = cyc.next
  (0..lim).each do |i|
    if (i % current_mod == 0)
      current_mod = cyc.next
      cnt += 1
    end
  end 
  cnt
end

Benchmark.bm do |x|
  x.report("Big test") {puts "What is the result of multiple_count(1000000000,[5395,7168,2367,9999,3])? #{multiple_count(1000000000,[5395, 7168, 2367, 9999, 3])}"}
end

