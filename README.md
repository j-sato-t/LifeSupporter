# LifeSupporter
サポート機能集（予定）

# 作りたい機能
- 買い物サポート
	- 消耗品の残数記録・取得
	- クーポン情報の記録・取得
	- 上記2つのリマインド
- 健康管理
	- 体温記録
	- 異常体温アラート

# フォルダ構成（初期案）
- ./
	- sources : ソースコード
		- ts : 作成したTypeScriptソース
			- shoppingSupporter
			- healthSuppoter
			- webClient
		- js : TypeScriptをコンパイルしたJavaScriptソース
			- （ts内と同じ構成）
	- databases : データベース定義ファイル（DBごとかテーブル単位かは未定、レコードは入れない予定）
		- shoppingSupporter
		- healthSupporter
	- resources : 静的リソース（webClient用？）
