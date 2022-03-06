require 'rails_helper'

RSpec.describe Idea, type: :model do
  context 'ideaの有効性について検証した場合' do
    before do
      @exist_category = create(:category, :task)
    end

    it '本文とcategory_idがあれば有効' do
      expect(build(:idea, :doing_task, category_id: @exist_category.id)).to be_valid
    end

    it '本文があっても、category_idがなければ無効' do
      expect(build(:idea, :doing_task, category_id: nil)).to_not be_valid
    end

    it 'カテゴリー名があっても、本文がなければ無効' do
      expect(Idea.new(body: nil, category_id: @exist_category.id)).to_not be_valid
    end
  end
end
