require 'parallel'

def ack(x, y)
	if x == 0 then
		return y + 1
	elsif y == 0 then
		return ack(x - 1, 1)
	else
		return ack(x - 1, ack(x, y - 1))
	end
end

def acks()
	return Parallel.map([1, 2, 3]) do |i|
		ack(i, i + 1)
	end
end

funcStart = Time.now
ackReturn = acks()
funcEnd = Time.now
puts funcEnd - funcStart

Parallel.each(ackReturn) do |i| 
	puts i
end