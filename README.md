  # s3Bucket_Lifecycle_CrossReplication
  S3Bucketを2つ別々のリージョンで作成しクロスリージョンレプリケーションするCFnテンプレートです。

  ####################################
   実行前にパラメータを埋めてください
   実行前にShellファイルの権限を755に変えて実行してください
   $chmod 755 s3Bucket_Lifecycle_CrossReplication.sh
  ####################################

  DESTINATION_AWS_REGION=''  #例：ap-northeast-3
  SOURCE_AWS_REGION=''  #例：ap-northeast-1
  DESTINATION_S3_BUCKETNAME=''  #世界で一意の名前
  SOURCE_S3_BUCKETNAME=''  #世界で一意の名前
  REPLICATION_STORAGECLASS=''  # STANDARD | DEEP_ARCHIVE | GLACIER | Glacier | GLACIER_IR | INTELLIGENT_TIERING | ONEZONE_IA | STANDARD_IA
  LIFECYCLE_STORAGECLASS=''  # STANDARD | DEEP_ARCHIVE | GLACIER | Glacier | GLACIER_IR | INTELLIGENT_TIERING | ONEZONE_IA | STANDARD_IA
