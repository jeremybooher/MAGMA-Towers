#!/bin/sh

run_num="25"

p="2"

for d in 3 5 7 9 11 13
do
	echo "load tower_data;  data_collection_periodic_monodromy2( $p ,1 , $d, 6 ,$run_num: printing:=true, store:=true, powers:=5);" | magma
done


