class Comment < ApplicationRecord
  belongs_to :user
  #userモデルと１対１で関連づける
  belongs_to :prototype
  #prototypeモデルと１対１で関連づける

  validates :content, presence: true
  #入力された値を検証,空ではないか
end