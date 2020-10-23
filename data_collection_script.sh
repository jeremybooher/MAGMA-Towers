#!/bin/sh

run_num="16"

p="3"

for d in 5 11
do
	echo "load example_finder;  analyze_examples($d, $p ,1000,2 : depth := 5, run_num:=$run_num, storing:=true,powers:=10);" | magma
done

