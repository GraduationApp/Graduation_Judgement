#encoding: UTF-8
class graduationcode < ApplicationController
def GraduationJudgement
    require 'csv'

    print("主専攻を入力して下さい\n")
    syusenkou = gets.chomp

    print("csvファイルを入力してください\n")
    filename = gets.chomp

    kamoku = Hash.new
    borderline = Hash.new

    syuutoku = {}

    tasenkou = Array.new
    jisenkou = ""
    kagaku = "GE6"
    sisutemu = "GE7"
    shigen = "GE8"

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

    kamoku = {"総合I" => /^1[1-3]/, "総合II"=> /^1[A-C]/, "総合III" => /^1[D-F]/, "共通英語" => /^31/,
        "第二外国語" => /^3[2-9]/, "体育" => /^2[1236]/, "必修科目1,2年" => /^GE1/, "選択科目1,2年" => /^(GA1|GE2)/, 
        "自専攻" => /^#{jisenkou}/, "選択科目3,4年" => /^(GE4|GA4|#{tasenkou[0]}|#{tasenkou[1]})/, "必修科目3,4年" => /(^GE5|#{jisenkou}+0103)/}
    
        borderline = {"総合I" => 2, "総合II"=> 5, "総合III" => 1, "共通英語" => 6,
        "第二外国語" => 3, "体育" => 2, "必修科目1,2年" => 22.5, "選択科目1,2年" => 32, 
        "自専攻" => 20, "選択科目3,4年" => 8, "必修科目3,4年" => 12}
    

    kamoku.each do |key, value|
    tmp = 0
    CSV.foreach(filename) do |user|
        if value =~ user[2]
            tmp += user[4].to_f
        end
        syuutoku[key] = tmp
    end
    end

    sa = 0
    jiyuu = 0
    borderline.each do |key, value|
        if syuutoku[key] > value
        tmp = syuutoku[key] - value
        jiyuu += tmp
        end
        if syuutoku[key] >= value
            printf("%sはOK(拾得:%d単位/必要:%d単位)\n", key, syuutoku[key], value)
        else
            sa = value - syuutoku[key]
            printf("%sが%d単位足りません\n", key, sa)
        end
    end
end

