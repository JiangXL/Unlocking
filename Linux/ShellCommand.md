* 批量重命名
> #! /bin/bash
 let a=1;
 #b= {ls -l | grep "^d" | wc -l};
  while [ $a -lt 2 ]
	 do
	  mv RGECO-CoChR_LT_555_KClt${a}c1.tif RGECO-CoChR_LT_555_KClt${a+23}c1.tif;
	let a=$a+1 ;
	echo $a;
done;
