#!/usr/bin/ruby
class Array
	def average
		self.reduce(:+).to_f/self.size
	end
end
gets.to_i.times{
	x=gets.chomp.split.map(&:size).average
	puts gets.to_i.times.map{
		a=gets.chomp.split
		name=a.shift[0..-2]
		[(a.map(&:size).average-x).abs,name]
	}.min.last
}