#!/bin/bash

#说明######
#1.磁盘使用量检查####
#2.指定文件删除(指定时间内没有更新的文件)###
##################################

################################
#関数定義
###############################

#マウンとポイント
DISK_AERA=/

#閾値
LIMIT=70

#削除対象時間(単位:min)
MIN=120

#削除対象パス
TARGET=/dev/shm/bodais/services/scoring1/000/
HTTPD=/var/log/httpd/

#DISK使用量
DISK_LIMIT=`df $DISK_AREA | tail -1 | /bin/sed 's/^.* \([0-9]*\)%.*$/\1/'`


if [ $DISK_LIMIT -gt $LIMIT ]; then
  #ファイル削除
   sudo find $TARGET -mmin +$MIN -not -path "$TARGET" -exec rm -rf {} \;
   sudo find $HTTPD -mmin +$MIN -not -path "$HTTPD" -exec rm -rf {} \;
fi
