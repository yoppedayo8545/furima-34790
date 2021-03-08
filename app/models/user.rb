class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字で設定してください'

  NAME_REGEX = /\A[あ-んア-ヴ一-龥々]+\Z/.freeze
  validates_format_of :last_name, with: NAME_REGEX, message: 'は全角の漢字で設定してください'
  validates_format_of :first_name, with: NAME_REGEX, message: 'は全角の漢字で設定してください'

  KANANAME_REGEX = /\A[ア-ヴ]+\Z/.freeze
  validates_format_of :last_kana, with: KANANAME_REGEX, message: 'は全角のカタカナで設定してください'
  validates_format_of :first_kana, with: KANANAME_REGEX, message: 'は全角のカタカナで設定してください'
end
