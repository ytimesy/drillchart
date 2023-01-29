
# アプリケーション名
drillchart

# アプリケーション概要
TECHCAMPサイト中の「自分が受けたテスト一覧」を読み取り、グラフから自分の理解度を把握することができます。また、テストの点数を表すグラフをクリックすると、そのテストのブラウザを新しく開きます。

# URL
https://drillchart.onrender.com

# 利用方法	
1.トップページのヘッダーから「データをとる」をクリックする。  
2.以下からグラフをクリックする  
  ・学習ガイド/基礎試験  
  ・基礎コース  
  ・応用コース  
  ・ドリル基礎  
  ・ドリル応用  
3.テストをしたいグラフをクリックする  

# アプリケーションを作成した背景
TECHCAMPサイトの「自分が受けたテスト一覧」から一目で分かるようにグラフにしたら良いと思いました。またいくつかに分類してまとめたら、もっと良いと思いました。さらに、そこから自分の苦手そうなテストを選んで復習できると良いと思いました。

# 洗い出した要件
要件定義書  
URL = https://docs.google.com/spreadsheets/d/1KfRA_Qdb9Hqayy-S0mRj4DWtflQ2R70mTi_2IQtfXZg/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明


# 実装予定の機能
得点が０点のところをクリックしてテスト受けれるようにする。

# データベース設計


# 画面遷移図

# 開発環境
プラットフォーム：Rails on Ruby 6.0.6.1  
テキストエディタ：VsCode

# ローカルでの動作方法
% git clone https://github.com/ytimesy/drillchart  
% cd drillchart  
% bundle install  
% yarn install  

# 工夫したポイント
多くのリソースを使わないです済むように、データベースを使わないようにしました。

# テーブル設計
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

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
