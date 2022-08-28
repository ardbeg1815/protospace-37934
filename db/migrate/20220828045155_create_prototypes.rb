class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title,      null: false                    #文字列タイプのカラム[title]を作成,空白不可
      t.text       :catch_copy, null: false                    #テキストタイプのカラム[catch_copy]を作成,空白不可
      t.text       :concept,    null: false                    #テキストタイプのカラム[concept]を作成,空白不可
      t.references :user,       null: false, foreign_key: true #userモデルのforeign_key(user_id)を追加,空白不可
      t.timestamps
    end
  end
end
