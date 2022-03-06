require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  describe 'アイデア登録API' do
    context 'リクエストのcategory_nameがcategoriesテーブルのnameに存在する場合' do
      before do
        @exist_category = create(:category, :task)
      end

      it 'ideasテーブルに登録できて、ステータスコード201を返す' do
        post api_v1_ideas_path, params: {
          category_name: @exist_category.name,
          body: build(:idea, :doing_task)
        }
        expect(response).to have_http_status(201)
      end

      it 'ideasテーブルに登録できて、ideasテーブルの件数が増える' do
        expect do
          post api_v1_ideas_path, params: {
            category_name: @exist_category.name,
            body: build(:idea, :doing_task)
          }
        end.to change { Idea.count }.from(0).to(1)
      end

      it 'ideasテーブルに登録できて、Categoryの件数は変わらない' do
        expect do
          post api_v1_ideas_path, params: {
            category_name: @exist_category.name,
            body: build(:idea, :doing_task)
          }
        end.to change { Category.count }.by(0)
      end
    end

    context 'リクエストのcategory_nameがcategoriesテーブルのnameに存在しない場合' do
      before do
        @exist_category = create(:category, :task)
        @new_category = build(:category, :application)
      end

      it 'ideasテーブルに登録できて、ステータスコード201を返す' do
        post api_v1_ideas_path, params: {
          category_name: @new_category.name,
          body: build(:idea, :doing_task)
        }
        expect(response).to have_http_status(201)
      end

      it 'ideasテーブルに登録できて、ideasテーブルの件数が増える' do
        expect do
          post api_v1_ideas_path, params: {
            category_name: @new_category.name,
            body: build(:idea, :doing_task)
          }
        end.to change { Idea.count }.from(0).to(1)
      end

      it 'ideasテーブルに登録でき、Categoryの件数も増加する' do
        expect do
          post api_v1_ideas_path, params: {
            category_name: @new_category.name,
            body: build(:idea, :doing_task)
          }
        end.to change { Category.count }.from(1).to(2)
      end
    end
  end
end
