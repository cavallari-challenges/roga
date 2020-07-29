class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  has_many :complaints, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :jwt_authenticatable,
    jwt_revocation_strategy: self

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false
  validates_format_of :email, with: Devise::email_regexp
end
