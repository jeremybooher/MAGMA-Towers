#!/bin/sh

run_num="14"

p="3"

for d in 31 32 34 35 37 38 40 41 43 44 46 47 49
do
	echo "load example_finder;  analyze_examples($d, $p ,1000,2 : depth := 4, run_num:=$run_num, storing:=true,powers:=10);" | magma
done

