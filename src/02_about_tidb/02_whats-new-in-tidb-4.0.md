# 4.0の新しい特徴

`TiDB v4.0`（以下略記`4.0`）が2020年5月28日にリリースされ、使いやすさ、安定性、パーフォーマンス、セキュリティおよび機能の方が大幅に改善されました。この記事では、改善されたことの簡単にを説明します、ユーザーは、実際のユースケースに基づいて`4.0`にアップグレードするかどうかを決定する必要があります。

## コア機能

### スケジューリング機能

- ホットスポットの対応ために、より多くのメトリックが考慮されます。これによに、書き込み、読み取りトラフィックに基づくスケジューリング基準しながら、新しい`key`のメトリックは考慮する。新しいスケジューリング方法は、トラフィックのみを考慮する場合と比較して、`CPU`リソースの使用率の不均一性の問題を大幅に改善できます。詳しくは[スケジューリング](https://docs.pingcap.com/tidb/stable/tidb-scheduling)をご覧ください。

### ストレージエンジン。

- `TiFlash`は`Realtime HTAP`機能用に`TiDB`によって追加されたコンポーネントです。`TiFlash`は`Multi-Raft Learner`プロトコルを使用して`TiKV`からリアルタイムでデータリードレプリカをコピーし、行方向ストレージエンジン`TiKV`とカラム型ストレージ`TiFlash`の完全一貫性を確保します。`TiKV`と`TiFlash`を異なるマシンにデプロイして、`HTAP`リソース割り当てと分離の問題を解決できます。詳しくは[TiFlash](https://docs.pingcap.com/tidb/stable/tiflash-overview)をご覧ください。

- `TiKV　v4.0`や新しいストレージフォーマットにある、幅の広いテーブルデータのエンコードとデコードの効率を向上させる。

[FIXME]: <> (多くの情報を調べた結果、`row-orientation storage engine`に対応する日本語が見つかりません。)

### TiDB Dashboard

DBAは`TiDB Dashboard`の`UI`を介してクラスターのトポロジー、構成情報、ログ情報、ハードウェア情報、オペレーティングシステム情報、スロークエリ情報、`SQL`情報、診断レポートなど。この情報は、DBAがデータベースシステムをすばやく理解して分析するのに役立ちます。詳細は以下の通りです。

- クラスター情報は、`TiDB`、`TiKV`、`PD`、`TiFlash`およびインスタンスの実行状態。

- `Key Visualizer`は`TiDB`クラスターの一定期間にトラフィックに関する履歴情報を取得して、DBAが`TiDB`クラスターの使用モードとホットスポットを分析します。

- `SQL`ステートメント情報は、データベースに実行されたすべての`SQL`と、実行回数、実行時間の記録して、ユーザーがデータベースの`SQL`実行ステータスをすばやく分析し、ホットスポットを含む`SQL`を見つける。

- `Slow Queries`は、クラスターのすべてのスロークエリステートメントを取得して、問題の解決に役立ちます。

- `Diagnostic Report`は、データベースが定期的に起こりうる障害を自動的に診断し、その診断結果とクラスター関連のメトリックを診断レポートにまとめます。診断レポートはWebページであり、ブラウザに保存した後、オフラインで読むおよび共有できます。

- `Log Search & Download`は、クラスターログを視覚的に把握して、DBAによるシステム問題の分析、メンテナンスの効率を向上させる。

### デプロイとメンテナンスのツール

`TiUP`は、`TiDB 4.0`でリリースされたデプロイとメンテナンスのツール。`TiUP`の主な役割は`TiDB`に関連するすべてのパッケージ、コンポーネント管理、ローカルデプロイ(Playground)、クラスター管理(Cluster)、アップグレードフレームワーク(TUF)、オフラインデプロイメントなどの機能があり、`TiDB`のインストール、デプロイメント、メンテナンスをツール化し、DBAの効率を向上させる。

- コンポーネント管理機能は、ワンクリックのコンポーネント情報クエリ、インストール、アップグレード、アンインストールなどの機能を提供し、DBAがTiDBのすべてのコンポーネントを管理しやすくします。

- コンポーネント管理。コンポーネント情報を照会し、クラスターを簡単にインストール、アップグレード、およびアンインストールできます。DBAにとって、`TiDB`コンポーネントの管理はよりもはるかに簡単です。

- クラスター管理機能(Cluster)は、複数の`TiDB`クラスターの展開、拡張、縮小、アップグレード、構成変更、開始、停止、再起動、クラスターの情報を取得の機能であり。

- ローカルデプロイ(Playground)は、`TiDB`の基本機能をすばやく体験と理解するために、ローカル環境にやすいで`TiDB`クラスターをデプロイして。注：この機能はプロダクション運用環境に使えない。

- プライベートミラー管理(Mirror)は、もしオフィシャルのミラーアクセスできないので、TiUPはプライベートミラーを構築するための方法を提供し、オフライン展開機能を提供します。

- パーフォーマンス試験の機能(Benchmark)は、`TPC-C`および`TPC-H`パフォーマンステストのワークロードを提供します。自動に展開と試験の機能があります。

### トランザクション

- ペシミスティックのトランザクションが正式なリリースして、デフォルトモードで。ペシミスティックのトランザクションは`Read Committed`の分離レベルと`SELECT FOR UPDATE NOWAIT`をサポートする。詳しくは[ペシミスティックのトランザクション](https://docs.pingcap.com/tidb/stable/pessimistic-transaction)をご覧ください。

- 大きなトランザクションをサポートして、トランザクションのサイズ制限が`100 MB`から`10 GB`に増加しました、楽観的およびペシミスティックの両方がサポートされます。詳しくは[トランザクションのサイズ制限](https://docs.pingcap.com/tidb/stable/transaction-overview#transaction-size-limit)をご覧ください。

### SQL 機能

- `SQL`プラン管理の`SQL Bind`を自動キャプチャと進化をサポートする、実行プランの使いやすさと安定性を向上させます。詳しくは[`SQL`プラン管理](https://docs.pingcap.com/tidb/stable/sql-plan-management)をご覧ください。

- 15の新しい`SQL Hint`が追加され、オプティマイザの実行プランの生成とクエリ実行時のエンジンの動作を制御します。詳しくは[`SQL Hint`](https://docs.pingcap.com/tidb/stable/optimizer-hints)をご覧ください。

- `SELECT INTO outfile`ステートメントをサポートし、テーブルデータを指定したファイルにエクスポートできます。`LOAD DATA`を使用すると、データベース間でデータを簡単にインポート/エクスポートできます。

- カスタムシーケンスをサポートし、`CACHE/NO_CACHE`と`CYCLE/NO_CYCLE`オプションをサポート、ユーザーはシーケンスを使用してID作成できます。詳しくは[`Sequence`](https://docs.pingcap.com/tidb/stable/sql-statement-create-sequence)をご覧ください。

- 新しい`Flashback`は、誤って`Truncate`されたテーブルを復元する。

- `OOM`を回避するには、`Join`と`Sort`の中間結果をディスクに書き込みます、システムの安定性を向上させる。

- `EXPLAIN`と`EXPLAIN ANALYZE`の表示を改善して、より多くの情報を表示して、トラブルシューティングの効率を向上させます。詳しくは[`EXPLAIN ANALYZE`](https://docs.pingcap.com/tidb/stable/sql-statement-explain-analyze)と[`EXPLAIN`](https://docs.pingcap.com/tidb/stable/sql-statement-explain)をご覧ください。

- `Index Merge`をサポートする。`Index Merge`は新しいテーブルデータアクセスメソッド。単一のテーブルを含むクエリの場合、複数のインデックスデータを自動的に読み取りにオプティマイザ、その結果を合併して、パフォーマンスを向上させます。詳しくは[`Index Merge`](https://docs.pingcap.com/tidb/stable/query-execution-plan#indexmerge-example)をご覧ください。

- `TiDB`カラムを`AUTO_RANDOM`のキーの属性をサポートする。ホットスポットの問題の解決を助ける、`MySQL`ユーザーのマイグレーションのコストを節約することができる。詳しくは[`AUTO_RANDOM`のキー](https://docs.pingcap.com/tidb/stable/auto-random)をご覧ください。

- クラスターのトポロジー、構成情報、ログ情報、ハードウェア情報、オペレーティングシステム情報、スロークエリ情報、`SQL`情報のテーブルを追加する。DBAがデータベースシステムをすばやく理解して分析するのに役立ちます。詳しくは[`Information Schema`](https://docs.pingcap.com/tidb/stable/information-schema)と[`SQL Diagnosis`](https://docs.pingcap.com/tidb/stable/information-schema-sql-diagnostics)をご覧ください。詳細は以下の通りです。
    - データベースシステムテーブル
        - `cluster_info`のテーブルは、クラスターのトポロジーの情報を保存する。
        - `cluster_log`のテーブルは、クラスターのログの情報を保存する。
        - `cluster_hardware`と`cluster_hardware`のテーブルは、クラスターのハードウェアとオペレーティングシステムの情報を保存する。
    - スロークエリ、`SQL`情報のテーブル
        - `cluster_slow_query`のテーブルは、グローバルのスロークエリの情報を保存する。
        - `cluster_processlist`のテーブルは、グローバルのプロセスリストの情報を保存する。
        - `inspection_result`のテーブルは、システムのボトルネックを自動的に分析し、DBAがパフォーマンス分析レポートを役立ちます。障害分析の効率を向上させる。
        - `metrics_summary`と`metric_summary_by_label`テーブルは、システムの全てのメトリックの情報を保存する、DBAが`SQL`を介してメトリックの読みますおよび過去のデータと比較する。
        - `inspection_summary`テーブルは、複数のデータリンクとアクセスリンク中のさまざまな主要な監視メトリックを保存する。DBAが読み取り、書き込みなどのリンクの障害を分析できます。


### 文字セットと照合順序

`TiDB 4.0`は大文字小文字を区別しません`utf8mb4_general_ci`とアクセントを区別しない`utf8_general_ci，详情参阅`をサポートする。詳しくは[文字セットと照合順序](https://docs.pingcap.com/tidb/stable/character-set-and-collation)をご覧ください。

### セキュリティ

- クライアントとサーバー、コンポーネント間の暗号化された通信を改善し、コネクタの安全を保証する。受信と送信されたデータがアタッカーによって読み取られたり改変されたりしないように保護します。証明書ベースの認証、オンラインで証明書を更新する、`TLS`証明書の`CommonName`属性を確認してなど。

- 透過的データ暗号化(TDE)は`TiDB`の新機能です、許可されているアプリケーションにデータを自動的に復号化して。TDEはファイルに対して、ディスク書き込み前に暗号化し、メモリに読み取り前に復号化して。`AES128-CTR`、`AES192-CTR`、`AES256-CTR`の暗号化アルゴリズムおよび`AWS KMS`にキーの管理をサポートする。詳しくは[保存時の暗号化](https://docs.pingcap.com/tidb/stable/encryption-at-rest)をご覧ください。

### バックアップと復元

バックアップの所要時間を短縮するテクニックは、単一の`TiDB`クラスターをバックアップと復元できます。高速の完全バックアップと復元をサポートし、データのソートして、範囲による分割をサポート。詳しくは[バックアップと復元](https://docs.pingcap.com/tidb/stable/backup-and-restore-tool)をご覧ください。

### サービスレベル

- `Prepare/Execute`リクエストの実行プランのキャッシュをサポートして、`SQL`実行効率を向上させる。詳しくは[`Prepare/Execute`プランのキャッシュ](https://docs.pingcap.com/tidb/stable/sql-prepare-plan-cache)をご覧ください。

- 新しいのレッドプールを実現します、スレッドプールの数を減らし、リクエストのスケジュールは最適化した。`TiDB`のパフォーマンスを向上させます。

- `Follower Read`は`Raft`プロトコルの完全一貫性を確保に基づ、`follower`ロールからデータを読み取ります、クラスターのスループットを改善し、`leader`ロールのロードを減らした。`Follower Read`ロードバランスのテクニック、`follower`ロールは完全一貫性を保証もできます。詳しくは[`Follower Read`](https://docs.pingcap.com/tidb/stable/follower-read)をご覧ください。
