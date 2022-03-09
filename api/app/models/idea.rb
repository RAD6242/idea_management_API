# frozen_string_literal: true

# Ideaモデルのvalidationやメソッドを定義
class Idea < ApplicationRecord
  MAX_TEXT_LENGTH = 65_535

  validates :body, presence: true, length: { maximum: MAX_TEXT_LENGTH }
  belongs_to :category

  def self.return_all_ideas
    Idea.eager_load(:category).all.map do |item|
      item.idea_format_json(item.category.name)
    end
  end

  def self.return_select_ideas(category)
    Idea.where(category_id: category.id).map do |item|
      item.idea_format_json(category.name)
    end
  end

  # null, 空文字, 長さの検証を行う
  def self.body_validation_check(body)
    !body.blank? && body.length < MAX_TEXT_LENGTH
  end

  def idea_format_json(category_name)
    {
      id: id,
      category: category_name,
      body: body,
      created_at: Time.parse(created_at.to_s(:db)).to_i
    }
  end
end
