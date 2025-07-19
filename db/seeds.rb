# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
DonationTarget..find_or_create_by!([
    { name: "日本赤十字社", website_url: "https://www.jrc.or.jp", contact_email: "info@jrc.or.jp", bank_account_info: "みずほ銀行 本店" },
    { name: "ユニセフ（UNICEF）", website_url: "https://www.unicef.or.jp", contact_email: "support@unicef.or.jp", bank_account_info: "三井住友銀行 本店" },
    { name: "国境なき医師団", website_url: "https://www.msf.or.jp", contact_email: "info@tokyo.msf.or.jp", bank_account_info: "三菱UFJ銀行 本店" },
    { name: "WWFジャパン", website_url: "https://www.wwf.or.jp", contact_email: "contact@wwf.or.jp", bank_account_info: "三井住友銀行 本店" },
    { name: "セーブ・ザ・チルドレン", website_url: "https://www.savechildren.or.jp", contact_email: "info@savechildren.or.jp", bank_account_info: "みずほ銀行 本店" },
    { name: "日本盲導犬協会", website_url: "https://www.moudouken.net", contact_email: "info@moudouken.net", bank_account_info: "三井住友銀行 本店" },
    { name: "あしなが育英会", website_url: "https://www.ashinaga.org", contact_email: "info@ashinaga.org", bank_account_info: "三菱UFJ銀行 本店" },
    { name: "プラン・インターナショナル", website_url: "https://www.plan-international.jp", contact_email: "info@plan-international.jp", bank_account_info: "三井住友銀行 本店" },
    { name: "オックスファム", website_url: "https://www.oxfam.or.jp", contact_email: "info@oxfam.or.jp", bank_account_info: "三菱UFJ銀行 本店" },
    { name: "シェア", website_url: "https://share.or.jp", contact_email: "info@share.or.jp", bank_account_info: "みずほ銀行 本店" },
    { name: "ピースウィンズ・ジャパン", website_url: "https://peace-winds.org", contact_email: "info@peace-winds.org", bank_account_info: "三井住友銀行 本店" },
    { name: "グッドネーバーズ・ジャパン", website_url: "https://www.gnjp.org", contact_email: "info@gnjp.org", bank_account_info: "三菱UFJ銀行 本店" }
])
