# TiDBメイン構造

`TiDB`はスケーリングと高い可用性の機能であり、深く理解欲しいなら、先ずは`TiDB`のメイン構造勉強します。`TiDB`クラスターは三かつメインコンポーネントである、`TiDB Server`、`PD Server`、`TiKV Server`である。`TiSpark`は、複雑な`OLAP`のソリューションを目指した、`TiDB Operator`は簡単に`Kubernetes`にデプロイできます。

![architecture](./img/tidb-architecture.png)

## TiDB Server

`TiDB Server`は`SQL`リクエストに受信します。`TiDB Server`は`SQL`を実行計画にインタプリタ後は`PD Server`にデータ保管の`TiKV Server`アドレス見つかった。`TiDB Server`を`TiKV Server`に通信データにアクセスして。`TiDB Server`は持久的データではありません、自体はストレジの機能ではない、計算のみを担当、スケーリングできます。負荷分散コンポーネント（`LVS`、`HAProxy`、`F5`）利用すれば、同じアドレスのことである。

## PD Server

`Placement Driver`（`PD`）は、クラスター全体の管理者、主な機能は3つであり、１つはクラスターのメタデータを保管するのこと（`Key`と`TiKV`の対応）、二つは`TiKV`クラスターのスケジューリングと負荷分散、そしてグローバルにユニークの増分のトランザクションのIDを管理配分する。

`PD`は`Raft`の分散コヒーレンスプロトコルを使用してデータのセキュリティを保証する。`Raft`のリーダーサーバーを全ての操作を処理する、他のフォロワーサーバーは高可用性を保証するためにのみ使用されます。奇数の`PD`サーバーを展開することをお勧めします。

## TiKV Server

`TiKV Server`はデータ実際の保管場所。外部向から、`TiKV`は分散トランザクションを提供するに`Key-Value`ストレージエンジンである。データを保存するための基本単位はリージョンであり、リージョンはレンジキー（`StartKey`から`EndKey`の左閉右開リージョン）のデータを保存する、1つの`TiKV`に複数のリージョンがあります。`TiKV`は、データの耐障害性を保証するために、`Raft`プロトコルの一貫性のレプリケーションを行うことがである。レプリケーションはリージョンで管理され、複数の異なるノードはリージョンはお互いのコピーである`Raft`グループを形成します。複数の`TiKV`間のデータのロードバランスは`PD`によってスケジュールされ、これもリージョン単位でスケジュールされます。

## TiSpark

`TiSpark`は、ユーザーの複雑な`OLAP`要件を解決する`TiDB`の主要コンポーネントとして、`TiDB`クラスターに`Spark SQL`直接に実行にことはである。`TiSpark`は分散`TiKV`クラスターの利点を組み合わせ、ビッグデータエコシステムに統合します。`TiSpark`を使用すると、`TiDB`は1つのクラスターで`OLTP`と`OLAP`の両方のシナリオを対応できるため、ユーザーはデータ転送を心配する必要がありません。

## TiDB Operator

`TiDB Operator`は、主流のクラウドインフラストラクチャ（`Kubernetes`）でTiDBクラスターを展開、管理、マルチクラスターハイブリッド、障害の自動修復できるようにします。
