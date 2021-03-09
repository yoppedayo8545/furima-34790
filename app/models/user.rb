class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字で設定してください'

  NAME_REGEX = /\A[あ-んア-ヴ一-龥々ー]+\z/.freeze
  validates_format_of :last_name, :first_name, with: NAME_REGEX, message: 'は全角の漢字で設定してください'

  KANANAME_REGEX = /\A[ア-ヴー]+\z/.freeze
  validates_format_of :last_kana, :first_kana, with: KANANAME_REGEX, message: 'は全角のカタカナで設定してください'
end
