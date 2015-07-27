#!/bin/bash

s3fs $S3BUCKET:$S3PATH /data/Packages -o iam_role=$AWS_IAM_ROLE,allow_other,rw

mkdir /tmp/$TOMCAT
CATALINA_TMPDIR=/tmp/$TOMCAT 
CATALINA_HOME=/usr/share/$TOMCAT
CATALINA_BASE=/var/lib/$TOMCAT
TOMCAT7_SECURITY=no
export CATALINA_TMPDIR CATALINA_HOME CATALINA_BASE TOMCAT7_SECURITY NUGET_HOME
/usr/share/$TOMCAT/bin/catalina.sh run
