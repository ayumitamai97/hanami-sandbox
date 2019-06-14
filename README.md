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
  - => lib/kintai/repositories/user_repository.rb:6 あたりに定義した
    - ref. modelを呼びたい側で `UserRepository.new.where(user_role: 1)` とかするの絶対よくない 責務が分散してしまうので
    - ……ので、repositoryにはリソースにわかりやすい名前をつけるのが良さそう

- Entityが不変だとか、EntityとRepositoryの責務とか、やってみるとわかる
- 入力値のバリデーションをControllerでするのはあまり好きではないかも……と思っていたが、
  - Railsで予期せぬところで `undefined method #hoge for nil:NilClass` とか出るとテンション下がるし
  - ↑を避けるために `#try` しまくるのも辛い気がしたので、（それがデファクトスタンダードである限りは）Controllerでバリデーションするのも納得できるな、と思った
  - ただ、Rails Wayから若干外れた(?)Rails開発でFormObjectとか使っていて、そこでバリデーションできるのなかなかいい気がしている
  - Hanamiにおける↑はInteractorかな ref. https://magazine.rubyist.net/articles/0056/0056-hanami.html
  
- HanamiのAssociationについてのidea 'Explicit Interface' (and 'Explicit Loading')
  ```
  When we declare an association, that repository does NOT get any extra method to its public interface.
  This because Hanami wants to prevent to bloat in repositories by adding methods that are often never used.
  ```
  なるほど〜 これが Pure Ruby に近い点……？（マジックが少ない）
  - Controllerの`.expose`も同様、黒魔術を減らして各クラスの責務/各メソッドのスコープを明示化している気がする
  
- 公式のドキュメンテーションがとても読みやすい…… Railsの api.rubyonrails.org, Rails Guides のように散らばっていなくて良い

- Viewが分割できるの慣れないがとてもやりやすい
  - ただ、これはこれで面倒で、スタートアップに向いてない理由もよくわかる
  - ちょっとした管理画面とかを作るにはオーバーな気がしなくもない
  
- 管理画面作るのめっちゃ楽
  - Rails Engineあんなに意味わからなかったのに、それに比べてRackをいい感じにラップしてくれている感……（ラップされているからこそよくわかっていないが）
  
- RESTを強く意識してなさそうな感じをroutingの記法とかgenerateされるcontroller (action) とかに感じる
  - => 違った。Railsとほぼ同じように`resources`という書き方ができた ref. https://guides.hanamirb.org/routing/restful-resources/
  - resourceではなくactionがclassとして定義されるので、当然必然的にFat Controllerっぽく'見える'ことはなさそうだし、
    基本的にControllerはRepository層で定義されたメソッドを使用してデータを間接的に操作し、viewに必要最低限の変数を返す&HTTPレスポンスを返すだけなので、
    ほんとに薄め〜になりそう。現場でHanamiを採用している会社はなかなか少なそうだが、現場ではどうなんだろうか
  
  
- 世間一般(?)に言われるHanamiの特徴に納得した
  （黒魔術が少ない、長期運用に向いている、Railsと似てはいないがRailsがそこそこうまく使えたらHanamiも使える）

- ビューヘルパーの使い勝手がRailsと似てるように見えてそうでもないというか、あんまり高機能じゃない気がする…（だからこそ黒魔術じゃなくていいのだが）
  - views/の記法は良い
  - templates/がシンプルになるのもいい
  - ビューヘルパーというかform helperが ... :thinking:
  - viewがなんかつらい気がする、RailsのAPIモードみたいな感じで使ったらよさそう……？
  
- Railsで、strong parameterを使うほどではないがparamsのエイリアス的にstrong parameterを定義することがある
  Hanamiでそういう記法ができないことはもちろんないが、特に推奨されているわけではなさそう？
  Parameters#require, Parameters#permitとかなく、getしかなさそう？
  - parameterもうちょっと扱いやすくならないんだろうか
  - parameterをごちゃっと書く感じにならざるをえないので、controllerの行数は大きくなる
    - controllerでバリデーションもするとさらに…
  
- どうしても`entity.update`とかしたくなってしまうRails癖

- 結局このメソッドってどの層に定義すればいいんだっけ？というのが今現在いまいちわかっていない ちゃんとDDD勉強した人がいる環境で導入しないかぎり結局つらそうではある

- バリデーションまではまだ実装できていない(6/13 23時時点)ので、どういう感じが適切なのかわかっていない

- RailsのMVC + FormObject, Service class, [ApplicationModelのある風景](https://speakerdeck.com/hshimoyama/rails-with-applicationmodel), [Decorator](https://github.com/amatsuda/active_decorator), ViewModel, ... など
  Rails Wayから外れつつもなるべく長期的に運用しやすくする設計は明確なガイドラインがなく、いつのまにかapp直下のディレクトリが増えてたりとかする気がする…
  - それに対してHanamiはどちらかといえば明確なガイドラインがあるので、Wayに沿っていれば長期運用しやすく煩雑な多機能クラスが生まれたりとかもあんまりしなさそう???(夢見すぎ?) 
  - どこにかけばいいの？問題がわりと起きづらそう
    - と思ったが, Railsにおけるview helperとかどこに定義すればいいのかわからない
    - => view helperは `Web::Views::ApplicationLayout` とかか

  
# 読んだ
- https://magazine.rubyist.net/articles/0056/0056-hanami.html
- https://nrslib.com/clean-ddd-entity/
- https://speakerdeck.com/hshimoyama/rails-with-applicationmodel
- https://speakerdeck.com/joker1007/realworld-domain-model-on-rails
- https://speakerdeck.com/joker1007/number-ginzarb
- https://speakerdeck.com/yasaichi/what-is-ruby-on-rails-and-how-to-deal-with-it
