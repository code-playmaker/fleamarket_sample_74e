class ShippingAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :post_code, :prefecture, :city, :house_number, presence: true
  validates :destination_family_name, :destination_first_name, format: {with: /\A[一-龥ぁ-ん]/, message: "は、全角漢字・ひらがなで入力してください"}
  validates :destination_family_name_kana, :destination_first_name_kana, format: {with: /\A[ぁ-んーー]+\z/, message: "は、全角ひらがなで入力してください"}
  validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "は、ハイフンを入れてください"}
  validates :phone, format: {with: /\A0\d{1,4}[-]\d{1,4}[-]\d{4}\z/, message: "は、ハイフン(-)を入れてください""0から始めてください"}, length: {minimum: 12}, allow_blank: true
  enum prefecture:{
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
end
