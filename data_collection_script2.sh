#!/bin/sh

run_num="29"

p="2"

for d in 23
do
	echo "load tower_data;  data_collection_periodic_monodromy2b( $p ,1 , $d, 7 ,$run_num: printing:=true, store:=false, powers:=3);" | magma
done


