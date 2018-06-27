#encoding: UTF-8
sougou1 = 0
sougou2 = 0
sougou3 = 0
eigo = 0
nigai = 0
taiiku = 0
s1_array = Array.new
s2_array = Array.new
s3_array = Array.new
eigo_array = Array.new 
nigai_array = Array.new 
taiiku_array = Array.new 
require 'csv'
print("csvファイルを入力して下さい\n")
filename = gets.chomp

CSV.foreach(filename,"r:Shift_JIS:UTF-8") do |user|
	if /^1[1-9]/ =~ user[2]
		sougou1 += user[4].to_f	
		s1_array = s1_array.concat([user[2], user[3], user[4]])
	
	elsif /^1[A-C]/ =~ user[2]
		sougou2 += user[4].to_f
		s2_array = s2_array.concat([user[2], user[3], user[4]])

	elsif /^1[D-G]/ =~ user[2]
		sougou3 += user[4].to_f
		s3_array = s3_array.concat([user[2], user[3], user[4]])
	
	elsif /^31/ =~ user[2]
		eigo += user[4].to_f
		eigo_array = eigo_array.concat([user[2], user[3], user[4]])

	elsif /^3[2-9]/ =~ user[2]
		nigai += user[4].to_f
		nigai_array = nigai_array.concat([user[2], user[3], user[4]])

	elsif /^2[1236]/ =~ user[2]
		taiiku += user[4].to_f
		taiiku_array = taiiku_array.concat([user[2], user[3], user[4]])
				
				
	end
	
end

print(sougou1, "\n")
print(sougou2, "\n")
print(sougou3, "\n")
print(eigo, "\n")
print(nigai, "\n")
print(taiiku, "\n")

print(s1_array.each_slice(3).to_a, "\n")
print(s2_array.each_slice(3).to_a, "\n")
print(s3_array.each_slice(3).to_a, "\n")
print(eigo_array.each_slice(3).to_a, "\n")
print(nigai_array.each_slice(3).to_a, "\n")
print(taiiku_array.each_slice(3).to_a, "\n")
