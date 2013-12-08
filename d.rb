#!/usr/bin/ruby
gets.to_i.times{
	n=gets.to_i
	a=n.times.map{
		x,y,w,h=gets.split.map(&:to_i)
		[Range.new(x,x+w),Range.new(y,y+h)]
	}
	f=a.size.times.any?{|i|
		(a[i][0].begin...a[i][0].end).all?{|x|
			(a[i][1].begin...a[i][1].end).all?{|y|
				a.size.times.any?{|j|
					i!=j &&
					a[j][0].include?(x) &&
					a[j][0].include?(x+1) &&
					a[j][1].include?(y) &&
					a[j][1].include?(y+1)
				}
			}
		}
	}
	puts f ? 'TRUE' : 'FALSE'
}