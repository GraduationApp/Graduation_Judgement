#encoding: UTF-8
require 'csv'
print("csvファイルを入力してください\n")
filename = gets.chomp

kamoku = Hash.new
syuutoku = {}
kamoku = {"sougou1" => /^1[1-3]/, "sougou2"=> /^1[A-C]/, "sougou3" => /^1[D-F]/, }

 kamoku.each do |key, value|
    tmp = 0
    CSV.foreach(filename) do |user|
        if value =~ user[2]
            tmp += user[4].to_i
        end
        syuutoku[key] = tmp
    end
end
print(syuutoku, "\n")

kagaku = /^GE4/
system = /^GE5/
shigen = /^GE6/

if syusenkou == kagaku
    jisenkou = kagaku
    tasenkou = [system, shigen]
elsif syusenkou == system 
    jisenkou = system
    tasenkou = [kagaku, shigen]
elsif syusenkou == shigen
    jisenkou = shigen
    tasenkou = [kagaku, system]
end

#自専攻