#!/usr/bin/ruby
gets.to_i.times{
	gets
	p gets.chomp.split.group_by{|e|e[0,1]}.map{|k,v|v.map(&:to_i).reduce(:+)}.max
}