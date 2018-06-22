#encoding: UTF-8

require 'csv'

print("主専攻を入力して下さい\n")
syusenkou = gets.chomp

print("csvファイルを入力してください\n")
filename = gets.chomp

kamoku = Hash.new
borderline = Hash.new
syuutoku = {}

tasenkou = Array.new
kagaku = "GE6"
sisutemu = "GE7"
shigen = "GE8"

ziyuukamoku = 0

if syusenkou == "kagaku"
    jisenkou = kagaku
    tasenkou = [sisutemu, shigen]
elsif syusenkou == "sisutemu" 
    jisenkou = sisutemu
    tasenkou = [kagaku, shigen]
elsif syusenkou == "shigen"
    jisenkou = shigen
    tasenkou = [kagaku, sisutemu]
end

#print(tasenkou, "\n")

kamoku = {"総合I" => /^1[1-3]/, "総合II"=> /^1[A-C]/, "総合III" => /^1[D-F]/, "共通英語" => /^31/,
"第二外国語" => /^3[2-9]/, "体育" => /^2[1236]/, "必修科目1,2年" => /^GE1/, "選択科目1,2年" => /^(GA1|GE2)/, 
"自専攻" => /^#{jisenkou}/, "選択科目3,4年" => /^(GE4|GA4|#{tasenkou[0]}|#{tasenkou[1]})/, 
"必修科目3,4年" => /^(GE5|#{jisenkou}+0103)/}

borderline = {"総合I" => 2, "総合II"=> 5, "総合III" => 1, "共通英語" => 6,
"第二外国語" => 3, "体育" => 2, "必修科目1,2年" => 22.5, "選択科目1,2年" => 32, 
"自専攻" => 20, "選択科目3,4年" => 8, "必修科目3,4年" => 12}


kamoku.each do |key, value|
   tmp = 0
   CSV.foreach(filename, "r:Shift_JIS:UTF-8") do |user|
       if value =~ user[2]
           if user[7] == "D"
           else
             tmp += user[4].to_f
           end
       else
         tmp += user[4].to_f
         ziyuukamoku = tmp 
       end

       if key == "自専攻"
           syuutoku[key] = tmp - 2
       else
           syuutoku[key] = tmp
      end
      
   end
end

soutannisuu = 0
CSV.foreach(filename, "r:Shift_JIS:UTF-8") do |user|
   soutannisuu += user[4].to_f 
end

print(syuutoku, "\n")

sa = 0
borderline.each do |key, value|
	if syuutoku[key] >= value
		print(key, "はOK\n")
	else
		sa = value - syuutoku[key]
		print(key, "が", sa, "単位分足りません\n")

	end
end

print("自由科目は、", ziyuukamoku, "単位です\n")
print("総単位数は、", soutannisuu, "単位です\n")

