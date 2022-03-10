# frozen_string_literal: true

categories = %w[
  タスク
  アプリケーション
  会議
  その他
]

ideas = [
  {
    category_name: 'タスク',
    body: '指定のタスクを実行する'
  },
  {
    category_name: 'アプリケーション',
    body: 'タスク管理ツール'
  },
  {
    category_name: '会議',
    body: 'オンラインでブレスト'
  },
  {
    category_name: 'その他',
    body: '急ぎではないが、やりたいこと'
  }
]

# 先にカテゴリーを生成
categories.each do |category|
  Category.create(name: category)
end

# N + 1問題を調査するため
# 4 * 1000件分のデータを生成
1000.times do
  ideas.each do |idea|
    Idea.create!(
      category_id: Category.find_by(name: idea[:category_name]).id,
      body: idea[:body]
    )
  end
end
