#! /bin/bash
let a=683; 
#echo {ls -l | grep "^d" | wc -l};

while [ $a -ne 0 ] ;
	do
	let b=$a+25;
	mv RGECO_LT-395t`echo | awk '{printf "%03d",'${a}' }'`c1.tif RGECO_LT_395t`echo | awk '{printf("%03d",'${b}')}'`c1.tif;
	echo | awk '{printf("%03d\n",'${b}')}'
	let a=$a-1 ;
done;
