#!/usr/bin/ruby
def solve(n)
	i=0
	while n>1
		if n%2==0
			n/=2
		else
			n=3*n+1
		end
		i+=1
	end
	i
end
gets.to_i.times{p solve(gets.to_i)}