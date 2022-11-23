# springboot-mysql-deploy-render-sample
Spring Boot (Java) + MySQL をホスティングサービス [Render](https://render.com/) にデプロイするためのサンプルです。  
[Render](https://render.com/) の無料のプランでデプロイできます。

READMEの作成日: 2022年11月23日

## Render について

### Free Plan の制約

- Java や MySQL をネイティブサポートしていない     
→ 今回は Docker のコンテナ1つで Java と MySQL の両方を動かす
- 起動時間: 1ヶ月あたり750時間  
→ 1つのアプリなら24時間常時起動できる
- 15分間リクエストが来ないと動作が一時停止する。一時停止した後の最初のリクエストは最大で30秒の応答遅延が発生する
- RAM: 512MB

## Spring Initializrで使用した条件
	
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
</details>
