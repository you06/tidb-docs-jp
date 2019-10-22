# TiDBの概要

`TiDB`は、[PingCAP](https://pingcap.com/en/) 研究開発の分散型`HTAP(Hybrid Transactional and Analytical Processing)`データベースであり、 [`RDBMS`](https://ja.wikipedia.org/wiki/%E9%96%A2%E4%BF%82%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0)と[`NoSQL`](https://ja.wikipedia.org/wiki/NoSQL)の最高の機能を組み合わせています。`TiDB`は`MySQL`と相互運用可能であり、機能拡張性、一貫性、高可用性ような属性を持っています。`OLTP (Online Transactional Processing)`および`OLAP (Online Analytical Processing)`の場合でワンストップソリューションを提供することは目标として追求しております。

TiDB 特徴：

- `MySQL`との互換性は高い

    [大体の場合](https://pingcap.com/docs/v3.0/reference/mysql-compatibility/)、コードを変更せずに移行できます。もしサブデータベースとサブテーブルを使用する、支援の移行ツールがあります。

- 無制限の拡張機能

    ノードを追加するだけで、無制限のパフォーマンス拡張届く。必要に応じてノードを拡張します、高並行性と大規模データのシナリオの処理は簡単です。

- [分散トランザクション](https://ja.wikipedia.org/wiki/%E5%88%86%E6%95%A3%E3%83%88%E3%83%A9%E3%83%B3%E3%82%B6%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3)

    `TiDB`標準の[`ACID`](https://ja.wikipedia.org/wiki/ACID_(%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E7%A7%91%E5%AD%A6))トランザクションを完全にサポート。
    
    公式文書にはこの1文しかありませんが、それでも、僕は言葉を言わなければなりません。分散トランザクションのサポートにより、成功なデータ変更が全てのノードですぐに有効になります。全てのノードを1つと考えるは喜んで。

- 本当の金融レベルの高い可用性

    クラシックのマスタースレーブスキームと比較して、`Raft`分散合意アルゴリズムの多数決合意スキームは完全に一貫性である、そして多数のレプリカ存在すれば、障害は自動回復、手動操作必要なし。

- 一歩の`HTAP`解決策

    `TiDB`はクラシックの`OLTP`行指向データベース、しかし強いの`OLAP`機能があります。`TiSpark`使用する、1つのストレージは`OLTP & OLAP`はできる、面倒くさいの[`ETL`](https://ja.wikipedia.org/wiki/Extract/Transform/Load)必要なし。

- クラウドネイティブSQLデータベース
    `TiDB`はクラウド用に設計されたデータベース、パブリッククラウド、プライベートクラウド、およびハイブリッドクラウドのサポートそれで展開、構成、および保守が簡単です。

`TiDB`の目標は100%の`OLTP`と80%の`OLAP`のシナリをサポートする。複雑の`OLAP`分析は[`TiSpark`](#)を使用できます。

`TiDB`はコードに侵入しない。クラシックのデータベースミドルウェアあるいはサブデータベースとサブテーブルを置換する。同時に、開発者と保守業務者はデータベースのスケール問題を考えしない、それためビジネス開発もと集中した。研究開発の効率性大きく向上させることがある。

# TiDBの始めかた

`TiDB`はローカルまたはクラウドプラットフォームに展開できます、パブリッククラウド、プライベートクラウド、あるいはハイブリッドクラウドのサポートをサポートできます。実際のシナリオに応じて、`TiDB`クラスターを展開するの方法を選択してください。

- [`Ansible`展開](#)：物理マシンの運用環境の`TiDB`は`Ansible`で展開する必要があります。

- [`Ansible`オフライン展開](#)：もしインターネットにアクセスできません、`Ansible`オフライン展開もおけ。

- [`TiDB Operator`展開](#)：`Kubernetes`環境の展開は、`TiDB Operator`使用します。`AWS`、`GKE`、`Aliyun`はサポートします。

- [`Docker Compose`展開](#)：`TiDB`の特徴をテストたいだけ、または開発環境に使用なら、`Docker Compose`は`TiDB`クラスターをローカルに迅速に展開できる。運用環境には適していません。

- [`Docker`展開](#)：`Docker`は`TiDB`を展開でくます、運用環境には適していません。

# ソースコード

- [TiDB](https://github.com/pingcap/tidb)

- [TiKV](https://github.com/tikv/tikv)

- [PD](https://github.com/pingcap/pd)

- [TiSpark](https://github.com/pingcap/tispark)

- [TiDB Operator](https://github.com/pingcap/tidb-operator)
