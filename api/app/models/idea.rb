# frozen_string_literal: true

# Ideaモデルのvalidationやメソッドを定義
class Idea < ApplicationRecord
  validates :body, presence: true
  belongs_to :category

  def self.return_all_ideas
    Idea.all.map(&:fetch_idea_json)
  end

  def self.return_select_ideas(category)
    Idea.where(category_id: category.id).map do |item|
      item.fetch_idea_json(category.name)
    end
  end

  def fetch_idea_json(category_name = nil)
    {
      id: id,
      category: category_name || Category.find(category_id).name,
      body: body,
      created_at: Time.parse(created_at.to_s(:db)).to_i
    }
  end
end
