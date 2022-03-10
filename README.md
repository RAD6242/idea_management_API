ご覧下さりありがとうございます。
<br>
<br>
開発に当たり、Githubで管理を行いました。

[Githubリンク](https://github.com/RAD6242/idea_management_API)
<br>
<br>

# アイデア管理API
アイデアを登録、一覧を取得できるAPIです。
<br>
<br>

# 開発環境
- Ruby on Rails (6.1.4.4)
- Ruby (3.0.3)
- MySQL (8.0)
- Docker
- docker-compose
- RSpec
- Rubocop
- Postman
<br>
<br>

# 開発において意識した点
- 疑似的にチーム開発を意識
  git-flowを実践したり、githubのIssueを活用し、チーム開発を意識した個人開発に挑戦しました。
  
- N+1問題を解決
  RSpecとPostmanを活用してAPIテストを実施し、N+1問題が発生してしまっていた箇所を発見・改善しました。

<br>
<br>

# 登録API
/api/v1/ideasにPOSTすることで登録ができます。
<br>
<br>

## 仕様
リクエストのcategory_nameがcategoiesテーブルのnameに存在する場合<br>
- category_nameからcategory_idを検索し、アイデアを登録します。<br>
- responseで201を返します。
<br>
<br>

リクエストのcategory_nameがcatogiresテーブルのnameに存在しない場合<br>
- 新たなカテゴリーを登録し、アイデアを登録します。<br>
- responseで201を返します。
<br>
<br>

バリデーションエラーになった場合<br>
- 新たなカテゴリーもアイデアも登録しません。<br>
- responseで422を返します。
<br>
<br>

## リクエスト形式
- category_name: string, null: false<br>
- body: string, null: false
<br>
<br>

# 取得API
/api/v1/ideasにGETすることでアイデアの一覧を配列で取得できます。
<br>
<br>
各アイデアは以下のように整形しています。created_atはunixtimeで返却します。

```
{
  id: number,
  category: string,
  body: string,
  created_at: number
}
```

<br>
<br>

## 仕様
リクエストのcategory_nameが指定されている場合<br>
- 該当するcategoryの一覧を返却します。<br>
<br>
<br>

リクエストのcategory_nameが指定されていない場合<br>
- すべてのアイデア一覧を返却します。<br>
<br>
<br>

登録されていないcategory_nameの場合<br>
- responseで404を返します。<br>
<br>
<br>

## リクエスト形式
- category_name: string<br>
<br>
<br>