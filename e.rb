#!/usr/bin/ruby
WIN=15.0/36
LOSE=21.0/36
def comb(n,k)
	s=1
	k=n-k if k*2>n
	k.times{|i|
		#s*=(n-i)/(i+1)
		s=s*(n-i)/(i+1)
	}
	s
end

gets.to_i.times{
	a,n=gets.split.map(&:to_i)
	e=n.times.reduce(0){|s,i|s+=gets.to_i}
	if e==0
		p a
	else
		s=0
		a.times{|i|
			#敗北でない限り、最後の手は必ずWINになる
			s+=(a-i)*comb(e-1+i,i)*LOSE**i*WIN**e
		}
		puts '%.12f'%s
	end
}