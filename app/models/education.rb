# frozen_string_literal: true

class Education < ApplicationRecord
  belongs_to :user

  validates :school_name, :education_type, :stream, presence: true
  validates :school_name, :education_type, :stream, format: { with: /[a-zA-Z ]/, message: 'Only letters are allowed' }
end
