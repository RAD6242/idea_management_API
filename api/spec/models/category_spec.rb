# frozen_string_literal: true

require 'rails_helper'

MAX_STRING_LENGTH = 255
OVER_LIMIT_STRING_LENGTH = MAX_STRING_LENGTH + 1

RSpec.describe Category, type: :model do
  context '保存前のモデルについて検証した場合' do
    it 'nameに値があれば有効' do
      expect(build(:category, :task)).to be_valid
    end

    it 'nameに値がなければ無効' do
      expect(Category.new(name: nil)).to_not be_valid
    end

    it 'nameが空白文字のみなら無効' do
      expect(Category.new(name: nil)).to_not be_valid
    end

    it "nameが#{OVER_LIMIT_STRING_LENGTH}文字以上なら無効" do
      expect(Category.new(name: 'a' * OVER_LIMIT_STRING_LENGTH)).to_not be_valid
    end
  end

  context '新規のカテゴリーを保存しようとした場合' do
    it 'nameに値があれば保存できる' do
      expect(create(:category, :task)).to be_valid
    end

    it 'nameに値がなければ保存できず例外が発生する' do
      expect { Category.create!(name: nil) }.to raise_error ActiveRecord::RecordInvalid
    end

    it '空白文字では保存できず例外が発生する' do
      expect { Category.create!(name: '     ') }.to raise_error ActiveRecord::RecordInvalid
    end

    it "nameが#{OVER_LIMIT_STRING_LENGTH}文字以上なら保存できず例外が発生する" do
      expect { Category.create!(name: 'a' * OVER_LIMIT_STRING_LENGTH) }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context '既存のカテゴリーを保存しようとした場合' do
    before do
      create(:category, :task)
    end

    it '保存できず例外が発生する' do
      expect { create(:category, :task) }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
