gets.to_i.times{
	c=gets.to_i
	score=[0]*c
	str=gets.chomp.split('')
	cur=0
	while str.size>0
		card=str.shift
		if ('1'..'9').include?(card)
			score[cur]+=card.to_i
		elsif card=='X'
			while !('1'..'9').include?(card)&&str.size>0 do card=str.shift end
			score[cur]*=card.to_i if ('1'..'9').include?(card)
		elsif card=='D'
			while !('1'..'9').include?(card)&&str.size>0 do card=str.shift end
			score[cur]/=card.to_i if ('1'..'9').include?(card)
		elsif card=='S'
			while !('1'..'9').include?(card)&&str.size>0 do card=str.shift end
			score[cur]-=card.to_i if ('1'..'9').include?(card)
		end
		cur=(cur+1)%c
	end
	p score.max
}