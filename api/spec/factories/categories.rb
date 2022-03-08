# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    trait :task do
      name { 'タスク' }
    end

    trait :application do
      name { 'アプリケーション' }
    end

    trait :meeting do
      name { '会議' }
    end

    trait :other do
      name { 'その他' }
    end
  end
end
