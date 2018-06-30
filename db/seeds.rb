# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8
Kamoku.create(:name => '総合I', :regexp => '^1[1-3]', :borderline => 2)
Kamoku.create(:name => '総合II', :regexp => '^1[A-C]', :borderline => 5)
Kamoku.create(:name => '総合III', :regexp => '^1[D-F]', :borderline => 1)
Kamoku.create(:name => '共通英語', :regexp => '^31', :borderline => 6)
Kamoku.create(:name => '第二外国語', :regexp => '^3[2-9]', :borderline => 3)
Kamoku.create(:name => '体育', :regexp => '^2[1236]', :borderline => 2)
Kamoku.create(:name => '1,2年必修科目', :regexp => '^GE1', :borderline => 22.5)
Kamoku.create(:name => '1,2年選択科目', :regexp => '^(GA1|GE2)', :borderline => 32)
Kamoku.create(:name => '自主専攻必修科目', :regexp => '', :borderline => 12)
Kamoku.create(:name => '自主専攻専門科目', :regexp => params[:jisenkou], :borderline => 20)
Kamoku.create(:name => '他主専攻・主専攻共通専門科目', :regexp => '^(GE4|GA4|#{tasenkou[0]}|#{tasenkou[1]})', :borderline => 8)
#if params[:jisenkou] == kagaku~~で主専攻分ける？
#これはただのRubyプログラムだからなんでもできる



