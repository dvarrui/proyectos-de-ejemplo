
def method_missing(m, *args, &block)
  items = m.to_s.split('_')
  if items[0]=='contar'
    fruta, hasta = ordenar_argumentos( items[1], items[2] )
    send(:contar, fruta, hasta)
  end
end

def ordenar_argumentos(a1, a2)
  hasta = 0
  fruta = ''
  if is_number? a1
    hasta = a1.to_i
    fruta = a2 || 'fruta'
  else
    fruta = a1
    if a2.nil?
      hasta = 1
    else
      hasta = a2.to_i
    end
  end
  return fruta, hasta
end

def is_number?(value)
  return true if value.class == Integer
  if value.class = String
    return true if value.to_i.to_s == value
  end
  return false
end

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
