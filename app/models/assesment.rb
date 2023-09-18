# frozen_string_literal: true

class Assesment < ApplicationRecord
  belongs_to :user

  validates :hobbies, :skills, :intrest, presence: true
  validates :hobbies, :skills, :intrest, format: { with: /[a-zA-Z ]/, message: 'Only letters are allowed' }
end
