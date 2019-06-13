# Kintai

Welcome to your new Hanami project!

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.1/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸


# 発表メモ
- やりたい理由: MVC以外の設計パターンに入門したい（本を先に読むより、実装してから読んだほうが頭に入りやすい気質なので、そうしたい）
- kintaiにした理由:
  - リソースがシンプルなほうがSinatra, Railsと比較しやすい
  - hanamiの旨みの一つに `By default, we have a web app, which can be thought of as the standard, user-facing web interface. (中略) Later (in a real project), we would add other apps, such as an admin panel, a JSON api, or an analytics dashboard.` があるので、管理者とエンドユーザの存在を想定するアプリケーションを作った方がその旨みを活かせて面白そう
  
# 感想
- Railsにおけるenum、ないんだ〜
  - MVCだったらModelに定数を定義してそこから読むことになりそう
    ```ruby
    class User
      include ActiveModel::Model # とか？確認してない
      
      ROLES = {
        0 => 'normal',
        1 => 'admin',
      }
      def role
        ROLES[user_role]
      end
    end
    ```
  - この辺りの `0` とか `1` を知っていたくないので、`Repository` の債務にするのが良さそう
