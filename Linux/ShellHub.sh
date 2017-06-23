#! /bin/bash
let a=1;
#echo {ls -l | grep "^d" | wc -l};

while [ $a -lt 458 ] ;
	do
	let b=$a+25;
	orgin=`echo | awk '{printf("%03d",a)}'`;
	replace=`echo | awk '{printf("%03d",b)}'`;
	mv RGECO-CoChR_LT_555_KClt${`echo | awk '{printf("%03d",a)}'`}c1.tif RGECO-CoChR_LT_555_KClt${replace}c1.tif;
	let a=$a+1 ;
done;
