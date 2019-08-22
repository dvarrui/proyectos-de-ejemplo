# Ejemplo de dvarrui
class Customer
	def display_info(input = {})
		output = ''
		output << "Their name is #{input[:firstname]}" if input[:firstname]
		output << " #{input[:lastname]}" if input[:lastname]
		output << " and their email address is #{input[:email]}" if input[:email]
		puts output
	end
end
