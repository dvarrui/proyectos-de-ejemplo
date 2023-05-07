# Bad names (version 2)

def get_them
  list1 = []
  the_list.each do |x|
    list1 << x if x[0] == 4
  end

  list1
end
