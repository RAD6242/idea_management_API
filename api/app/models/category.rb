# frozen_string_literal: true

# CategoryモデルのvalidationとIdeaモデルとの関連性を定義
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :idea
end
