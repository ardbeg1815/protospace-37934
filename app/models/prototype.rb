class Prototype < ApplicationRecord
  belongs_to :user                        #userモデルと１対１で関連づける
  has_one_attached :image                 #Active Storage設定１つのファイルを追加する
  has_many :comments, dependent: :destroy #prototypeモデルが削除された場合commentsモデルも削除

  validates :title,      presence: true #入力された値を検証,空でないか
  validates :catch_copy, presence: true #入力された値を検証,空でないか
  validates :concept,    presence: true #入力された値を検証,空でないか
  validates :image,      presence: true #入力された値を検証,空でないか
end