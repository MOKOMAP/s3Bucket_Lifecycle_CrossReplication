####################################
#
# 実行前にパラメータを埋めてください
# 実行前にShellファイルの権限を
#
#
####################################

PWD=$(pwd)

DESTINATION_AWS_REGION=''  #例：ap-northeast-3
SOURCE_AWS_REGION=''  #例：ap-northeast-1
DESTINATION_S3_BUCKETNAME=''  #世界で一意の名前
SOURCE_S3_BUCKETNAME=''  #世界で一意の名前
REPLICATION_STORAGECLASS=''  # STANDARD | DEEP_ARCHIVE | GLACIER | Glacier | GLACIER_IR | INTELLIGENT_TIERING | ONEZONE_IA | STANDARD_IA
LIFECYCLE_STORAGECLASS=''  # STANDARD | DEEP_ARCHIVE | GLACIER | Glacier | GLACIER_IR | INTELLIGENT_TIERING | ONEZONE_IA | STANDARD_IA

aws cloudformation deploy \
    --region ${DESTINATION_AWS_REGION} \
    --stack-name DestinationS3Bucket \
    --template-file 1_DestinationS3Bucket.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides \
    DestinationS3BucketName=${DESTINATION_S3_BUCKETNAME} \


aws cloudformation deploy \
    --region ${SOURCE_AWS_REGION} \
    --stack-name SourceS3Bucket \
    --template-file 2_SourceS3Bucket.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides \
    DestinationS3BucketName=${DESTINATION_S3_BUCKETNAME} \
    SourceS3BucketName=${SOURCE_S3_BUCKETNAME} \
    ReplicationStorageClass=${REPLICATION_STORAGECLASS} \
    LifecycleStorageClass=${LIFECYCLE_STORAGECLASS} 
