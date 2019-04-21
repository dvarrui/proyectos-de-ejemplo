
def contar(fruta, hasta=1)
  fruta[-1]='' if fruta[-1]=='s' # Limpiar plural 
  (1..hasta).each do |i|
    puts "* #{fruta.capitalize} #{i}"
  end
  $total = total + hasta
end

def total
  return ($total || 0)
end
