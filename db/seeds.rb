# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#大学生
(1..100).each do |number|
  User.create(uid: "senior" + number.to_s, name: "シニア" + number.to_s, status: "seniors", school: "東京" + number.to_s + "大学", department: "経済学部", grade: "学部1年", subject: "経済学科")
end

#高校生
(1..100).each do |number|
  User.create(uid: "junior" + number.to_s, name: "ジュニア" + number.to_s, status: "seniors", grade: "高校1年")
end

#申請
(10..100).each do |number|
  Link.create(junior_id: number, senior_id: 7, chat: "approve", uuid: "chat" + number.to_s)
end

#レビュー
(10..100).each do |number|
  Review.create(junior_id: number, senior_id: 7, star: 5, content: "ありがとうございました/nまたお願いします！")
end