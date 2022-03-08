# frozen_string_literal: true

# Ideaモデルのvalidationやメソッドを定義
class Idea < ApplicationRecord
  validates :body, presence: true
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

  def idea_format_json(category_name)
    {
      id: id,
      category: category_name,
      body: body,
      created_at: Time.parse(created_at.to_s(:db)).to_i
    }
  end
end
