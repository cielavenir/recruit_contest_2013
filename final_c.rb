#!/usr/bin/ruby
T={'S'=>0,'M'=>1,'L'=>2}
gets.to_i.times{
	a=gets.chomp.chars.map{|e|T[e]}.sort
	b=gets.chomp.chars.map{|e|T[e]}.sort
	puts a.zip(b).all?{|x,y|x>=y} ? :YES : :NO
}