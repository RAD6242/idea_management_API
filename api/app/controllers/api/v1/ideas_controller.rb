# frozen_string_literal: true

module Api
  module V1
    # アイデア取得・登録API
    class IdeasController < ApplicationController
      def index
        # category_nameが存在しなければ、すべての一覧を返却して早期リターン
        unless params[:category_name]
          render json: Idea.return_all_ideas
          return
        end

        category = Category.find_by(name: params[:category_name])
        if category
          render json: Idea.return_select_ideas(category)
        else
          render status: 404
        end
      end

      def create
        # category_name, bodyに対してnil, 空文字, 長さの検証を行う
        if Category.name_validation_check(params[:category_name]) && Idea.body_validation_check(params[:body])
          category = Category.find_or_create_by(name: params[:category_name])
          Idea.create(category_id: category.id, body: params[:body])
          render status: 201
        else
          render status: 422
        end
      end
    end
  end
end
