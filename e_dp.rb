#!/usr/bin/ruby
WIN=15.0/36
LOSE=21.0/36
a=Array.new(10001){Array.new(101)}
a[0][0]=1
1.step(10000){|i|a[i][0]=a[i-1][0]*WIN}
1.step(100){|j|
	a[0][j]=a[0][j-1]*LOSE
	1.step(10000){|i|a[i][j]=a[i][j-1]*LOSE+a[i-1][j]*WIN}
}
gets.to_i.times{
	x,n=gets.split.map(&:to_i)
	e=n.times.reduce(0){|s,i|s+=gets.to_i}
	if e==0
		p x
	else
		#敗北でない限り、一番最後の手は必ずWINとなることに注意する
		puts '%.12f'%x.times.reduce(0){|s,i|s+=WIN*a[e-1][i]*(x-i)}
	end
}