# frozen_string_literal: true

module Api
  module V1
    # アイデア取得・登録API
    class IdeasController < ApplicationController
      def create
        category = Category.find_or_create_by(name: params[:category_name])
        if Idea.create!(category_id: category.id, body: params[:body])
          render status: 201
        else
          render status: 422
        end
      end
    end
  end
end
