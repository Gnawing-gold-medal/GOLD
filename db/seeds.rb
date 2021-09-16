# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@example.jp",
             password:  "11111111",)

Customer.create(telephone_number: '11122223333',password: '000000', email: 'customer1@example.jp', address: '東京', postal_code: '0001111', last_name: '河村', first_name: 'たかし', last_name_kana: 'カワムラ', first_name_kana: 'タカシ',)
Customer.create(telephone_number: '11122223333',password: '000000', email: 'customer2@example.jp', address: '千葉', postal_code: '0001111', last_name: '今村', first_name: 'たかし', last_name_kana: 'イマムラ', first_name_kana: 'タカシ',)
Customer.create(telephone_number: '11122223333',password: '000000', email: 'customer3@example.jp', address: '東京', postal_code: '0001111', last_name: '高木', first_name: '小松菜', last_name_kana: 'タカギ', first_name_kana: 'コマツナ',)
Customer.create(telephone_number: '11122223333',password: '000000', email: 'customer4@example.jp', address: '神奈川', postal_code: '0001111', last_name: '杉野', first_name: '星都', last_name_kana: 'スギノ', first_name_kana: 'セイト',)

Address.create(customer_id: 1, name: "大村秀章",postal_code: "1234567",address: "愛知")
Address.create(customer_id: 1, name: "高須克弥",postal_code: "1111111",address: "愛知")

Genre.create!(name: "ケーキ")
Genre.create!(name: "プリン")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "キャンディ")

Item.create!(genre_id: 1, name: "ショートケーキ", introduction: "栃木県産のとちおとめを使用しています。", price: 400, is_active: true, image: open("./app/assets/images/shortcake.jpg"))
Item.create!(genre_id: 1, name: "チーズケーキ", introduction: "美味しい", price: 1000, is_active: true, image: open("./app/assets/images/cheesecake.jpg"))
Item.create!(genre_id: 1, name: "チョコケーキ", introduction: "甘い", price: 600, is_active: true, image: open("./app/assets/images/chocolatecake.jpg"))
Item.create!(genre_id: 1, name: "モンブランケーキ", introduction: "和栗を使用", price: 800, is_active: true, image: open("./app/assets/images/montblanccake.jpg"))
Item.create!(genre_id: 3, name: "マカロン", introduction: "かわいい", price: 400, is_active: true, image: open("./app/assets/images/makaroons.jpg"))
Item.create!(genre_id: 4, name: "キャンディ", introduction: "キャンディの詰め合わせ", price: 400, is_active: false, image: open("./app/assets/images/candy.jpg"))

CartItem.create!(item_id: 1, customer_id: 1, amount: 2)
CartItem.create!(item_id: 2, customer_id: 1, amount: 3)
CartItem.create!(item_id: 4, customer_id: 1, amount: 8)
CartItem.create!(item_id: 3, customer_id: 2, amount: 4)
CartItem.create!(item_id: 5, customer_id: 2, amount: 5)

Order.create!(customer_id: 1, name: "大村秀章",postal_code: "1234567",address: "愛知",shipping_cost: 800,total_payment: 7840,payment_method: 0,status: 0)
Order.create!(customer_id: 2, name: "今村たかし",postal_code: "1234567",address: "愛知",shipping_cost: 800,total_payment: 1200,payment_method: 1,status: 1)

OrderItem.create!(order_id: 1, item_id: 1,price: 440,amount: 1,making_status: 1)
OrderItem.create!(order_id: 1, item_id: 2,price: 550,amount: 2,making_status: 1)
OrderItem.create!(order_id: 1, item_id: 3,price: 660,amount: 3,making_status: 1)
OrderItem.create!(order_id: 1, item_id: 4,price: 880,amount: 4,making_status: 1)