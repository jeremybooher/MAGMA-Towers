#!/bin/sh

run_num="24"

p="2"

for d in 5 7 9 11 13 15 17 19 21 23
do
	echo "load example_finder;  analyze_examples($d, $p ,20,20 : depth := 5, run_num:=$run_num, storing:=true,powers:=10);" | magma
done

