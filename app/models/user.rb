class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # relation 

  has_many :assesments
  has_many :educations

  #define enum for gender
  enum gender: {
    male: 0,
    female: 1,
  }


  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable,
          jwt_revocation_strategy: self
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  # role o-> user(default) 1 ->admin
  enum role: %i[0 1]
  after_initialize :set_default_role, if: :new_record?
  # set default role to user  if not set
  def set_default_role
    self.role ||= :user
  end

end
