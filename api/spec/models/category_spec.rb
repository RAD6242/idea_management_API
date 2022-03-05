require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'idea' do

  end

  context '新規のカテゴリーを保存しようとした場合' do
    it 'nameに値があれば保存できる' do
      expect(create(:category, :task)).to be_valid
    end

    it 'nameに値がなければ保存できず例外が発生する' do
      expect { Category.create(name: '') }.to raise_error
    end

    it '空白文字では保存できず例外が発生する' do
      expect { Category.create(name: '     ') }.to raise_error
    end
  end

  context '既存のカテゴリーを保存しようとした場合' do
    before do
      create(:category, :task)
    end

    it '保存できず例外が発生する' do
      existed_task = build(:category, :task)
      expect { existed_task.save }.to raise_error ActiveRecord::RecordNotUnique
    end

    # it 'categoriesの件数は変わらない' do
    # end
  end
end
