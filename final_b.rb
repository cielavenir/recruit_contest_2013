#!/usr/bin/ruby
gets.to_i.times{
	n=gets.to_i
	s=gets.chomp
	r=0
	i=1
	while i<=s.size
		if s[0,i].to_i(2)>=n
			r+=1
			s=s[i..-1]
			i=0
		end
		i+=1
	end
	p r
}