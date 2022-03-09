# frozen_string_literal: true

# CategoryモデルのvalidationとIdeaモデルとの関連性を定義
class Category < ApplicationRecord
  MAX_STRING_LENGTH = 255

  validates :name, presence: true, uniqueness: true, length: { maximum: MAX_STRING_LENGTH }
  has_many :idea

  # null, 空文字, 長さの検証を行う
  def self.name_validation_check(category_name)
    !category_name.blank? && category_name.length < MAX_STRING_LENGTH
  end
end
