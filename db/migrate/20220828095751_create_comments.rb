class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :content,   null: false
      #テキスト型の[content]を作成,空白不可
      t.references :user,      null: false, foreign_key: true
      #userモデルの外部キー(user_id)を追加.空白不可
      t.references :prototype, null: false, foreign_key: true
      #prototypeモデルの外部キー(prototype_id)を追加
      t.timestamps
    end
  end
end
