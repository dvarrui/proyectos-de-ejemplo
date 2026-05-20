#!/usr/bin/env ruby

rows = (1..9).to_a
$max = rows.count

def select?(row1, row2)
  return true if (row1 + row2) < 9
  return false
end

def search(rows, acc)
  search_x(1, acc)
end

def search_x(row1, acc)
  acc = search_xy(row1, row1 + 1, acc)
  if row1 < $max - 1
    acc = search_x(row1 + 1, acc)
  end
  acc
end

def search_xy(row1, row2, acc)
  if select?(row1, row2)
    acc += 1
    puts "==> #{row1}, #{row2}"
  else
    puts "==> #{row1}, #{row2} NO"
  end
  if row2 < $max
    acc = search_xy(row1, row2 + 1, acc)
  end
  return acc
end

acc = 0
acc = search(rows, acc)
puts acc


