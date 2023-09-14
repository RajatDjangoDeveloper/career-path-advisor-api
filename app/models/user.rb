class User < ApplicationRecord
  # relation
  has_many :assesments, dependent: :destroy
  has_many :educations, dependent: :destroy

  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?
  # set default role to user  if not set
  def set_default_role
    self.role ||= :user
  end

  enum gender: %i[male female not_specified]
  after_initialize :set_default_gender, if: :new_record?
  # set default gender to not_specified  if not set
  def set_default_gender
    self.gender ||= :not_specified
  end

  def admin?
    role == 'admin'
   end
end
