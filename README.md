# springboot-mysql-deploy-render-sample
Spring Boot (Java) + MySQL をホスティングサービス [Render](https://render.com/) にデプロイするためのサンプルです。  
[Render](https://render.com/) の無料のプランでデプロイできます。

READMEの作成日: 2022年11月23日

## Render について

### Free Plan の制約

- **Java や MySQL をネイティブサポートしていない**     
→ 今回は Docker のコンテナ1つで Java と MySQL の両方を動かす
- 起動時間: 1ヶ月あたり750時間  
→ 1つのアプリなら24時間常時起動できる
- 15分間リクエストが来ないと動作が一時停止する。一時停止した後の最初のリクエストは最大で30秒の応答遅延が発生する
- RAM: 512MB

### デプロイ手順

1. [Render](https://render.com/) にログインする。自分のプライベートリポジトリからデプロイしたい場合は、GitHub または GitLab と連携しておく。
1. Dashboard ページを開き、「 New > Web Service 」から新規Webサービス作成画面に移動する。
1. 自分のプライベートリポジトリを選択するか、パブリックリポジトリのURLを入力する。
1. 「 Name 」に Web サービス名を入力する。その他の項目はデフォルトのままでデプロイできる。

※正しいソースコードでログが正常の場合でも、Render側でデプロイ失敗の判定になることがあります。その場合は各 Web サービス画面の「 Manual Deploy > Clear build cache & deploy 」を試すとうまくいくかもしれません。

## 備考

### [Dockerfile](/Dockerfile)

マルチステージングビルドを利用して、OpenJDK イメージで Spring Boot アプリケーションのビルドを行った後、その生成物の jar ファイルを Ubuntu イメージにコピーします。その後、Ubuntu イメージで Java と MySQL をインストールして起動します。

※環境変数PORTが無いとデプロイに失敗するので、```ENV PORT=8080```を記述しています。

### [my.cnf](/my.cnf)

MySQL の設定ファイルです。メモリの使用量を削減するため、パフォーマンススキーマを無効にしています。

### Spring Initializr で生成したときの設定

```
Project: Gradle Project
Language: Java
Spring Boot: 2.7.5
Project Metadata: (デフォルトと同じ)
  Group: com.example
  Artifact: demo
  Name: demo
  Description: Demo project for Spring Boot
  Package name: com.example.demo
Packaging: Jar
Java: 17
Dependencies:
  Spring Web
  MySQL Driver
  MyBatis
```
