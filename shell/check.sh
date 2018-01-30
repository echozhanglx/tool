#!/bin/bash
####说明######
#1.文件有无检查###
#2.文件大小检查####

stock_list=stock_list.csv;

for stock in `cat ${stock_list}`
do 
 value=$(ls ${stock}_5d/ | wc -l)
 if [ $value -lt 46 ] ; then
   echo $stock $value
 else
     for FILE in ${stock}_5d/*
       do
       size=$(wc -c ${FILE} | awk '{print $1}')
       if [ $size -lt 1000 ]; then
	    echo $stock $FILE $size
       fi
       done
 fi
done

