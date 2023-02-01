
# アプリケーション名
drillchart

# アプリケーション概要
TECHCAMPサイト中の「自分が受けたテスト一覧」を読み取り、グラフから自分の理解度を把握することができます。また、テストの点数を表すグラフをクリックすると、そのテストのブラウザを新しく開きます。

# URL
https://drillchart.onrender.com

# 利用方法	
1.最初の画面のヘッダーから「データをとる」をクリックする。  
2.トップページの以下の項目に対応するグラフをクリックする。
　または、ヘッダーにあるボタンをクリックしても同じ動作となる。  
  ・学習ガイド/基礎試験  
  ・基礎コース  
  ・応用コース  
  ・ドリル基礎  
  ・ドリル応用  
3.テストをしたいグラフをクリックする  

# アプリケーションを作成した背景
TECHCAMPサイトの「自分が受けたテスト一覧」を一目で分かるようなグラフにしたら良いと思いました。またいくつかに分類してまとめたら、もっと良いと思いました。さらに、そこから自分の苦手そうなテストを選んで復習できると良いと思いました。

# 洗い出した要件
要件定義書  
URL = https://docs.google.com/spreadsheets/d/1KfRA_Qdb9Hqayy-S0mRj4DWtflQ2R70mTi_2IQtfXZg/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
## 最初の画面
drillchartアプリのURLを開く時の最初の画面です。  
ヘッダーの「データをとる」をクリックするとTECHCAMPにアクセスするので、ログインします。  
ログインしたら、何もせずに１３秒くらい待ちます。ログインに失敗したら、他の操作をするとエラーになります。  
[![Image from Gyazo](https://i.gyazo.com/add4e10ed6111a24be976da169367ae1.jpg)](https://gyazo.com/add4e10ed6111a24be976da169367ae1)

## 総合学習　理解度表示機能の画面
TECHCAMPの「自分が受けたテスト一覧」を基にこれまでの学習理解度（点数）をグラフにしました。  
テストは以下の５つに分類しています。  
見たいコースをクリックすることで、コース別の受けたテストを振返ることができます。  
・学習ガイド/基礎試験  
・基礎コース  
・応用コース  
・ドリル基礎  
・ドリル応用  
[![Image from Gyazo](https://i.gyazo.com/f2fbf03b1b29a6ca404cb359311cb175.png)](https://gyazo.com/f2fbf03b1b29a6ca404cb359311cb175)

## コース別理解度表示機能の画面（基本コースの時）
基礎コースに分類された「自分が受けたテスト一覧」の学習理解度（点数）をグラフにしました  
テストのグラフをクリックすると、テストをすることができます。  
[![Image from Gyazo](https://i.gyazo.com/f6a9755cc3d05db2cd2370dfcff5c6f7.png)](https://gyazo.com/f6a9755cc3d05db2cd2370dfcff5c6f7)

# 実装予定の機能
得点が０点のところをクリックしてテスト受けれるようにする。

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/396851972d5db1ec431a2fd24a3b8eee.png)](https://gyazo.com/396851972d5db1ec431a2fd24a3b8eee)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a6b22c5e514f59d12be37e84acb7811f.png)](https://gyazo.com/a6b22c5e514f59d12be37e84acb7811f)

# 開発環境
 オペレーティングシステム  
　*macOS Monterey 12.6.2  
プラットフォーム  
　*Rails 6.0.6.1  
開発言語  
　*ruby 2.6.5p114  
ライブラリ管理ツール  
　*Bundler 2.4.5  
　*npm 6.14.17  
テキストエディタ  
　*VsCode  

# ローカルでの動作方法
% git clone https://github.com/ytimesy/drillchart  
% cd drillchart  
% bundle install  
% yarn install  

# 工夫したポイント
多くのリソースを使わないです済むように、データベースを使わないようにしました。

# 資料１　テーブル設計
## drills テーブル

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| id            | integer | null: false, unique       |
| title         | string  | null: false               |
| category      | integer | null: false               |
| htrfvalue     | string  | null: false               |
| score         | integer | null: false               |
| max_score     | integer | null: false               |

### 保存先
 CSV file : drills.csv

