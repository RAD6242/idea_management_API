# frozen_string_literal: true

FactoryBot.define do
  factory :idea do
    trait :doing_task do
      body { '指定のタスクを実行する。' }
    end

    trait :create_application do
      body { 'タスク管理ツール' }
    end

    trait :online_meeting do
      body { 'オンラインでブレスト' }
    end

    trait :other_idea do
      body { '急ぎではないが、やりたいこと' }
    end
  end
end
