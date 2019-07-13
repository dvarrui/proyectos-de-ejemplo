
def contar(fruta, hasta=1)
  i = 0
  while(i<hasta)
    i +=1
    puts "* #{fruta.capitalize} #{i}"
  end
  return i
end
