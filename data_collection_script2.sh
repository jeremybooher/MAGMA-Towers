#!/bin/sh

run_num="26"

p="3"

for d in 5 8 11
do
	echo "load tower_data;  data_collection_periodic_monodromy( $p ,1 , $d, 5 ,24: printing:=true, store:=true, powers:=5);" | magma
done

