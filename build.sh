#!/bin/bash

S3_ENDPOINT="http://192.168.170.12:80"
JAR_DIR="s3://deephub/user/pureuser/spark-distcp/"

echo "Making jar file"
sbt package

echo
echo "Uploading to S3"
mv target/scala-2.11/spark-distcp-assembly-0.2.2+1-97d96e4e+20200311-0241-SNAPSHOT.jar target/scala-2.11/spark-distcp-assembly-0.2.2.jar
s5cmd --endpoint-url=$S3_ENDPOINT cp target/scala-2.11/spark-distcp-assembly-0.2.2.jar $JAR_DIR

echo "Done"

