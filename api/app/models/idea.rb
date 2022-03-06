# frozen_string_literal: true

# Ideaモデルのvalidationやメソッドを定義
class Idea < ApplicationRecord
  validates :body, presence: true

  belongs_to :category

  def self.return_all_ideas
    Idea.all.map(&:fetch_idea_json)
  end

  def self.return_select_ideas(category_id)
    Idea.where(category_id: category_id).map(&:fetch_idea_json)
  end

  def fetch_idea_json
    {
      id: id,
      category: Category.find(category_id).name,
      body: body,
      created_at: Time.parse(created_at.to_s(:db)).to_i
    }
  end
end
