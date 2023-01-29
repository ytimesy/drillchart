
# アプリケーション名
drillchart

# アプリケーション概要
TECHCAMPサイト中の「自分が受けたテスト一覧」を読み取り、グラフから自分の理解度を把握することができます。また、テストの点数を表すグラフをクリックすると、そのテストのブラウザを新しく開きます。

# URL
https://drillchart.onrender.com

# 利用方法	



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
