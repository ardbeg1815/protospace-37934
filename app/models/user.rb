class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,       presence: true #入力された値を検証,空でないか
  validates :profile,    presence: true #入力された値を検証,空でないか
  validates :occupation, presence: true #入力された値を検証,空でないか
  validates :position,   presence: true #入力された値を検証,空でないか

  has_many :prototypes #prototypeモデルに１対多で関連づける
  has_many :comments  #commentモデルに１対多で関連づける
end
