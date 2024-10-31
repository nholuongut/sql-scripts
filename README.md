# SQL Scripts

![](https://i.imgur.com/waxVImv.png)
### [View all Roadmaps](https://github.com/nholuongut/all-roadmaps) &nbsp;&middot;&nbsp; [Best Practices](https://github.com/nholuongut/all-roadmaps/blob/main/public/best-practices/) &nbsp;&middot;&nbsp; [Questions](https://www.linkedin.com/in/nholuong/)
<br/>

Useful SQL scripts, split from [DevOps Bash tools](https://github.com/nholuongut/devops-bash-tools), for which this is now a submodule.

## Inventory

### DevOps / DBA

- `aws_athena_cloudtrail_ddl.sql` - [AWS Athena](https://aws.amazon.com/athena/) DDL to setup up integration to query [CloudTrail](https://aws.amazon.com/cloudtrail/) logs from Athena
- `bigquery_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) scripts:
  - `bigquery_billing_*.sql` - billing queries for [GCP](https://cloud.google.com/) usage eg. highest cost services, most used GCP products, recent charges etc.
  - `bigquery_info_*.sql` - information schema queries for datasets, tables, columns, partitioning, clustering etc.
- `mysql_*.sql`:
  - [MySQL](https://www.mysql.com/) / [MariaDB](https://mariadb.org/) queries for DBA investigating + performance tuning
  - `mysql_info.sql` - summary overview, useful to debug your `mysql.user` table auth effects
    - (shows intended `USER()` vs actual `CURRENT_USER()`)
  - tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.x
- `postgres_*.sql`:
  - [PostgreSQL](https://www.postgresql.org/) queries for DBA investigating + performance tuning
  - [postgres_info.sql](https://github.com/nholuongut/sql-scripts/blob/master/postgres_info.sql) - big summary overview, recommend you start here
  - tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.x
- `oracle_*.sql`:
  - [Oracle](https://www.oracle.com) queries for DBA investigating
  - tested on Oracle 9i, 10g, 11g, 19c

### Analytics

- `bigquery_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) scripts:
  - `bigquery_billing_*.sql` - billing queries for [GCP](https://cloud.google.com/) usage eg. highest cost services, most used GCP products, recent charges etc.
  - `bigquery_info_*.sql` - information schema queries for datasets, tables, columns, partitioning, clustering etc.
  - [analytics/](https://github.com/nholuongut/sql-scripts/tree/master/analytics)`bigquery_*.sql` - ecommerce queries and [BigQuery ML](https://cloud.google.com/bigquery-ml/docs/bigqueryml-intro) machine learning classification logistic regression models and purchasing predictions
  - for more [BigQuery](https://cloud.google.com/bigquery) examples, see [Data Engineering demos](https://github.com/GoogleCloudPlatform/training-data-analyst/tree/master/courses/data-engineering/demos)


### DevOps SQL tooling

[![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=nholuongut&repo=DevOps-Bash-tools&theme=ambient_gradient&description_lines_count=3)](https://github.com/nholuongut/devops-bash-tools)

You can quickly test the PostgreSQL / MySQL scripts using `postgres.sh` / `mysqld.sh` / `mariadb.sh` in the [DevOps Bash tools](https://github.com/nholuongut/devops-bash-tools) repo, which boots a docker container and drops straight in to a `mysql` / `psql` shell with this directory mounted at `/sql` and used as `$PWD` for fast easy sourcing eg.

postgres:

```postgres-sql
\i /sql/postgres_query_times.sql
```

```postgres-sql
\i postgres_query_times.sql
```

mysql:

```mysql-sql
source /sql/mysql_sessions.sql
```

```mysql-sql
\. mysql_sessions.sql
```

### Related scripts

- [.psqlrc](https://github.com/nholuongut/devops-bash-tools/blob/master/.psqlrc) - advanced PostgreSQL psql client config
- [psql.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/psql.sh) - quickly connect to PostgreSQL with command line switches inferred from environment variables
- [mysql.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/mysql.sh) - quickly connect to MySQL / MariaDB with command line switches inferred from environment variables
- [postgres.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/postgres.sh) - one-touch PostgreSQL, boots docker container and drops you in to `psql` shell. Version can be given as an argument
- [mysqld.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/mysqld.sh) / [mariadb.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/mariadb.sh) - one-touch MySQL / MariaDB, boots docker container and drops you in to `mysql` shell. Version can be given as an argument
- [postgres_foreach_table.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/postgres/postgres_foreach_table.sh) / [mysql_foreach_table.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/mysql/mysql_foreach_table.sh) - execute templated SQL queries/statements against all or a subset of tables
- [postgres_tables_row_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/postgres/postgres_tables_row_counts.sh) / [mysql_tables_row_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/mysql/mysql_tables_row_counts.sh) - get row counts for all or a subset of tables
- [sqlcase.pl](https://github.com/nholuongut/DevOps-Perl-tools/blob/master/sqlcase.pl) - autocases your SQL code
  - I use this a lot and call it via hotkey configured in my [.vimrc](https://github.com/nholuongut/devops-bash-tools/blob/master/configs/.vimrc)
  - there are `*case.pl` specializations for most of the major RDBMS and distributed SQL systems, even several NoSQL systems, using each one's language specific keywords
- Hive & Impala SQL:
  - [beeline.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/beeline.sh) - quickly connect to Hive, auto-determines HiveServer2 address, Kerberos & SSL options, ZooKeeper quorum
  - [impala_shell.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_shell.sh) - quickly connect to Impala, auto-determines a Hadoop worker node address and Kerberos options (can use an environment variable for a [Load Balancer](https://github.com/nholuongut/HAProxy-configs/blob/master/bigdata/impala-jdbc.cfg) setup)
  - [hive_foreach_table.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/hive_foreach_table.sh) / [impala_foreach_table.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_foreach_table.sh) - execute templated SQL queries/statements against all or a subset of tables
  - [hive_tables_row_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/hive_tables_row_counts.sh) / [impala_tables_row_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_tables_row_counts.sh) - get row counts for all or a subset of tables
  - [hive_tables_column_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/hive_tables_column_counts.sh) / [impala_tables_column_counts.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_tables_column_counts.sh) - get the column counts for big tables in Hive / Impala
  - [hive_tables_metadata.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/hive_tables_metadata.sh) / [impala_tables_metadata.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_tables_metadata.sh) / [hive_tables_locations.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/hive_tables_locations.sh) / [impala_tables_locations.sh](https://github.com/nholuongut/devops-bash-tools/blob/master/bigdata/impala_tables_locations.sh) - get Hive / Impala metadata for all or a subset of tables, eg. Location to determine where the external tables data is being stored (HDFS / S3 paths)

# 🚀 I'm are always open to your feedback.  Please contact as bellow information:
### [Contact ]
* [Name: nho Luong]
* [Skype](luongutnho_skype)
* [Github](https://github.com/nholuongut/)
* [Linkedin](https://www.linkedin.com/in/nholuong/)
* [Email Address](luongutnho@hotmail.com)
* [PayPal.me](https://www.paypal.com/paypalme/nholuongut)

![](https://i.imgur.com/waxVImv.png)
![](Donate.png)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/nholuong)

# License
* Nho Luong (c). All Rights Reserved.🌟