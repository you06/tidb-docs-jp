# TiDBの概要

`TiDB`は、[PingCAP](https://pingcap.com/en/) 研究開発の分散型`HTAP(Hybrid Transactional and Analytical Processing)`データベースであり、 [`RDBMS`](https://ja.wikipedia.org/wiki/%E9%96%A2%E4%BF%82%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0)と[`NoSQL`](https://ja.wikipedia.org/wiki/NoSQL)の最高の機能を組み合わせています。`TiDB`は`MySQL`と相互運用可能であり、機能拡張性、一貫性、高可用性ような属性を持っています。`OLTP (Online Transactional Processing)`および`OLAP (Online Analytical Processing)`の場合でワンストップソリューションを提供することは目标として追求しております。

TiDB 特徴：

- `MySQL`と高い互換性

    [ほとんどの場合](https://pingcap.com/docs/v3.0/reference/mysql-compatibility/)、コードを変更せずに移植できます。もしサブデータベースとサブテーブルを使用すると、移植ツールがあってサポートします。

- 無制限の拡張機能

    ノードを追加するだけで、パフォーマンスが無制限で拡張するになっていますし、必要なノードを拡張すれば、高並行性と大規模データのシナリオの処理は簡単になります。

- [分散トランザクション](https://ja.wikipedia.org/wiki/%E5%88%86%E6%95%A3%E3%83%88%E3%83%A9%E3%83%B3%E3%82%B6%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3)

    `TiDB`は、標準の[`ACID`](https://ja.wikipedia.org/wiki/ACID_(%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E7%A7%91%E5%AD%A6))トランザクションを完全にサポートしています。

    公式ドキュメントにはこの一文しかありませんが、もう一つつたえたいのは、分散トランザクションのサポートにより、データの変更は成功になったら全てのノードがすぐに有効です。全てのノードが一つという思いがあったら良いです。

- 金融レベルな高い可用性

    クラシックのマスタースレーブスキームに比べて、`Raft`の分散コヒーレンスプロトコルアプローチは終始一貫のことを保証します。そして、レプリカが多く存在すれば、障害が発生の時に人工の操作が要らなくて自動回復ことができます。

- ワンストップ`HTAP`ソリューション

    `TiDB`は典型的な`OLTP`ラインアンドバンクデータベースとともに、強いの`OLAP`機能があります。`TiSpark`を配合して、1つのストレージは`OLTP`と`OLAP`を同時に処理し、面倒な[`ETL`](https://ja.wikipedia.org/wiki/Extract/Transform/Load)プロセスが要りません。

- クラウドネイティブSQLデータベース

    TiDBは、クラウドデータベース、パブリッククラウド、プライベートクラウド、およびハイブリッドクラウドをサポートします。展開、構成、および保守することは簡単です。

`TiDB`は100%の`OLTP`と80%の`OLAP`のシナリをサポートすることを目指して、複雑な`OLAP`分析が要ると[`TiSpark`](#)を使用できます。

`TiDB`はコードに侵入しなくて、クラシックのデータベースミドルウェアあるいはサブデータベースとサブテーブルを置換します。そして、開発者と保守業務者はデータベースのスケール問題を考え必要はなくて、ビジネスの開発ことをもと集中します。研究開発の効率性大きく向上させることがある。

# TiDBの始める

`TiDB`はローカルまたはクラウドプラットフォームに展開できます。パブリッククラウド、プライベートクラウド、あるいはハイブリッドクラウドもサポートできます。実際のシナリオに応じて、TiDBクラスターを展開するの方法を選択してください。

- [`Ansible`展開](#)：プロダクション運用環境で展開する場合、`Ansible`を使用して`TiDB`クラスターをデプロイしなければならない。

- [`Ansible`オフライン展開](#)：デプロイメント環境がネットワークにアクセスすることができない場合は、`Ansible`オフライン展開することもできます。

- [`TiDB Operator`展開](#)：`Kubernetes`環境の展開は、`TiDB Operator`使用します。`AWS`、`GKE`、`Aliyun`はサポートします。

- [`Docker Compose`展開](#)：`TiDB`をテスト、`TiDB`の新たな特徴を試す、またはスタンディング環境に使用する場合は、`Docker Compose`は`TiDB`クラスターをローカルに迅速に展開することができます。（プロジェクト環境には適していません）

- [`Docker`展開](#)：`Docker`を使用して`TiDB`クラスターをデプロイできます。（プロジェクト環境には適していません）

# ソースコード

- [TiDB](https://github.com/pingcap/tidb)

- [TiKV](https://github.com/tikv/tikv)

- [PD](https://github.com/pingcap/pd)

- [TiSpark](https://github.com/pingcap/tispark)

- [TiDB Operator](https://github.com/pingcap/tidb-operator)
