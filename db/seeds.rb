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
Genre.create!(name: "ホールケーキ")
Genre.create!(name: "プリン")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "キャンディ")

Item.create!(genre_id: 1, name: "ショートケーキ", introduction: "長野県産の「章姫(あきひめ)」を使用しています。", price: 500, is_active: true, image: open("./app/assets/images/cake/shortcake.jpg"))
Item.create!(genre_id: 1, name: "チョコレートケーキ", introduction: "ココアスポンジにチョコレートクリームとビターな味わいのガナッシュを重ねた、ワンランク上のチョコレートケーキです。", price: 550, is_active: true, image: open("./app/assets/images/cake/chocolatecake.jpg"))
Item.create!(genre_id: 1, name: "モンブラン", introduction: "香り豊かな和栗の味わいが楽しめるモンブランです。", price: 500, is_active: true, image: open("./app/assets/images/cake/montblanccake.jpg"))
Item.create!(genre_id: 1, name: "ロールケーキ", introduction: "国産フルーツが彩りあざやかなロールケーキです。", price: 450, is_active: true, image: open("./app/assets/images/cake/rollcake.jpg"))
Item.create!(genre_id: 1, name: "アプリコットタルト", introduction: "蜜漬けのあんずを贅沢に使用したタルトです。", price: 700, is_active: true, image: open("./app/assets/images/cake/apricottart.jpg"))
Item.create!(genre_id: 1, name: "苺のチーズケーキ", introduction: "濃厚なストロベリーソースを贅沢に使用したチーズケーキです。", price: 600, is_active: true, image: open("./app/assets/images/cake/strawberrycheesecake.jpg"))
Item.create!(genre_id: 1, name: "苺のタルト", introduction: "サクサクのタルト生地にフレッシュな苺をたっぷり飾り、ストロベリーソースで仕上げました。", price: 550, is_active: true, image: open("./app/assets/images/cake/strawberrytart.jpg"))

Item.create!(genre_id: 2, name: "ブルーベリータルト(ホール)", introduction: "サクサクのタルト生地にフレッシュなブルーベリーをたっぷり飾りました。", price: 1000, is_active: true, image: open("./app/assets/images/wholecake/blueberrytart.jpg"))
Item.create!(genre_id: 2, name: "チーズケーキ(ホール)", introduction: "クリームチーズをメインにマスカルポーネ、カマンベールをアクセントに加えたこだわりのチーズケーキです。", price: 1200, is_active: true, image: open("./app/assets/images/wholecake/cheesecake.jpg"))
Item.create!(genre_id: 2, name: "チョコレートケーキ(ホール)", introduction: "濃厚なチョコレートケーキです。", price: 1100, is_active: false, image: open("./app/assets/images/wholecake/chocolatecake.jpg"))
Item.create!(genre_id: 2, name: "フルーツタルト(ホール)", introduction: "サクサクのタルト生地にフレッシュなフルーツをたっぷり飾りました。", price: 1000, is_active: true, image: open("./app/assets/images/wholecake/fruitstart.jpg"))
Item.create!(genre_id: 2, name: "苺のタルト(ホール)", introduction: "サクサクのタルト生地にフレッシュな苺をたっぷり飾り、ストロベリーソースで仕上げました。", price: 1100, is_active: true, image: open("./app/assets/images/wholecake/strawberrytart.jpg"))

Item.create!(genre_id: 3, name: "フルーツプリン", introduction: "フルーツをたっぷり乗せたミルクプリンです。", price: 400, is_active: true, image: open("./app/assets/images/pudding/pudding.jpg"))

Item.create!(genre_id: 4, name: "チョコレートマフィン", introduction: "濃厚なチョコレートの味わいを楽しめるマフィンです。", price: 400, is_active: true, image: open("./app/assets/images/baked/chocolatemuffins.jpg"))
Item.create!(genre_id: 4, name: "クリスマスクッキー", introduction: "クリスマスにぴったりなかわいいクッキーです。", price: 450, is_active: false, image: open("./app/assets/images/baked/cristmascookie.jpg"))

Item.create!(genre_id: 4, name: "マカロン", introduction: "ショコラ、アールグレイ、バニラの3種類がセットになっています。", price: 700, is_active: true, image: open("./app/assets/images/baked/makaron.jpg"))
Item.create!(genre_id: 4, name: "オレンジケーキ", introduction: "オレンジピールを贅沢に使用し、ビターなチョコレートでコーティングしました。", price: 500, is_active: true, image: open("./app/assets/images/baked/orangecake.jpg"))
Item.create!(genre_id: 4, name: "スコーン", introduction: "サクサクのスコーンに、別添えのフルーツジャムをかけてお召し上がりください。", price: 450, is_active: true, image: open("./app/assets/images/baked/scones.jpg"))

Item.create!(genre_id: 5, name: "キャンディ", introduction: "カラフルなキャンディの瓶詰めです。", price: 500, is_active: true, image: open("./app/assets/images/candy/candy.jpg"))


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

Infomation.create!(name: "後藤", telephone_number: "0120117117" ,email: "goto@example.jp" ,genre: 3, content: "もっと安くして欲しい" , status: 0)
Infomation.create!(name: "田中", telephone_number: "0120444444" ,email: "tanakao@example.jp" ,genre: 0, content: "髪の毛が入っていた。変品したい。" , status: 1)
Infomation.create!(name: "佐藤", telephone_number: "0120117117" ,email: "sato@example.jp" ,genre: 1, content: "振込先がよくわからない" , status: 1)
Infomation.create!(name: "鈴木", telephone_number: "0120444444" ,email: "suzuki@example.jp" ,genre: 2, content: "アイコンは誰が移っているのか。" , status: 1)
Infomation.create!(name: "佐々木", telephone_number: "0120117117" ,email: "sasaki@example.jp" ,genre: 3, content: "もっと安くして欲しい" , status: 0)
Infomation.create!(name: "高橋", telephone_number: "0120444444" ,email: "takahasi@example.jp" ,genre: 0, content: "髪の毛が入っていた。変品したい。" , status: 0)
Infomation.create!(name: "今井", telephone_number: "0120117117" ,email: "imai@example.jp" ,genre: 3, content: "もっと安くして欲しい" , status: 0)
Infomation.create!(name: "渡辺", telephone_number: "0120444444" ,email: "watanabe@example.jp" ,genre: 0, content: "髪の毛が入っていた。変品したい。" , status: 1)
