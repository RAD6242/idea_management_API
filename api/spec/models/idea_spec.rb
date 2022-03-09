# frozen_string_literal: true

require 'rails_helper'

MAX_TEXT_LENGTH = 65_535
OVER_LIMIT_TEXT_LENGTH = MAX_TEXT_LENGTH + 1

RSpec.describe Idea, type: :model do
  context 'ideaの有効性について検証した場合' do
    before do
      @exist_category = create(:category, :task)
    end

    it '有効な本文とcategory_idがあれば有効' do
      expect(build(:idea, :doing_task, category_id: @exist_category.id)).to be_valid
    end

    it '本文があっても、category_idが無ければ無効' do
      expect(build(:idea, :doing_task, category_id: nil)).to_not be_valid
    end

    it 'category_idがあっても、本文が無ければ無効' do
      expect(Idea.new(body: nil, category_id: @exist_category.id)).to_not be_valid
    end

    it 'category_id、本文ともに無ければ無効' do
      expect(Idea.new(body: nil, category_id: nil)).to_not be_valid
    end

    it "本文が#{OVER_LIMIT_STRING_LENGTH}文字以上なら無効" do
      expect(Idea.new(body: 'a' * OVER_LIMIT_TEXT_LENGTH, category_id: @exist_category.id)).to_not be_valid
    end
  end
end
