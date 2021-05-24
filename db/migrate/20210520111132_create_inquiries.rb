class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name  # 名前
      t.string :email # レールアドレス
      t.text :message # メッセージ

      t.timestamps
    end
  end
end
