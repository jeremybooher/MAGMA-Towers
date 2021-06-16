# Invariants of Curves in Zp Towers over Finite Fields

This repository provides [MAGMA](http://magma.maths.usyd.edu.au/magma/) programs for computing with differentials on Zp-towers of curves totally ramified over one point of the projective line over a finite field of characteristic p.  It is used extensively in the paper "Geometric Iwasawa Theory for Zp-Towers of Curves in Characteristic p" by Jeremy Booher and Bryden Cais; that paper also includes an overview of the method and the mathematics underlying it.  While it is orders-of-magnitude faster than the generic methods provided for function fields in MAGMA, individual interesting examples still require many hours to run.  This repository also stores the results of many examples (mostly in characteristic two and three) and includes functionality to analyze them.

It uses code for computing with Witt Vectors developed by [Luis Finotti](https://www.math.utk.edu/~finotti/) ([github repository](https://github.com/lrfinotti/witt)).

# Files

- tower_computation provides basic methods for describing curves in a Zp tower of curves over a field of charactersitic p totally ramified at one point and for computing with the Cartier operator on the space of regular differentials.

- tower_data uses tower_computation to collect data about the a-number and dimension of the kernel of powers of the Cartier operator on the space of regular differentials for Zp towers with specified ramification.

- example_finder will select interesting examples of Zp towers where the anumber of the first level takes on different values, and then collects data up the tower.  (It also includes functions for dealing with Z/pZ covers.)

- data_storage stores the results of the computations (copied and pasted as they are run), as individual examples can take several days.  The main results are collected_data, while higher_powers includes a few examples which treat very large powers of the Cartier operator.  data_storage2 includes some examples of non-basic towers.

- data_storage_small stores many more examples where fewer levels of the tower are analyzed.

- data_analysis provides some functions for analyzing the stored computations, producing tables, and checking conjectures.

- other_examples computes some complemantary examples for the paper that aren't basic towers.

- etas.m gt.m lift.m lift_j.m sec_coord.m witt.m are the files from Luis Finotti's [project](https://github.com/lrfinotti/witt) on computing with Witt vectors.

# Archives

The Computations folder includes the text output of many of the computations incorporated into data_storage, data_storage2, and data_storage_small.  It should not be necessary to look at it.  

The Precomputations folder stores a bunch of precomputations about a Zp tower, including a description as a sequence of Artin-Schreier extensions and the key precomputations with the Cartier operator on a subset of the regular differentials.  These steps are usually the most time consuming when doing a computation, so these can substantially speed up further analysis of a tower (for example, looking at additional powers of the Cartier operator).  The precomputations are quite large, so a sample is stored on github and the full [archive](https://www.dropbox.com/sh/wgi3lx9uu5ynaly/AAD1tCy4HF_dKQbXHpkEuMIga?dl=0) is stored elsewhere.

# Theory

See "Geometric Iwasawa Theory for Zp-Towers of Curves in Characteristic p" by Jeremy Booher and Bryden Cais.

# Usage

The analyze_examples function is the easiest to use.

	load example_finder;
	d:=7; p:=3;
	analyze_examples(d, p ,1000,2 : depth := 5, run_num:=271828 storing:=true,powers:=10);

This picks some random basic Z_3 towers with ramification invariant 7 and then computes the dimension of the kernel of the rth power of the Cartier operator for r up to 10 on the first 5 levels of the tower.  It selects the towers by picking 1000 Artin-Schreier covers of the projective line ramified at one point and computing the a-number of each.  Then for each a-number occuring, it tries to pick 2 basic towers whose first level is one of the Artin-Schreier covers with that a-number.  

- There will be terminal output.

-  The run_num options are used to archive the results in Computations as a text file (computations271828.txt) and also as a MAGMA-readable list (computations271828.txt.magma).  The latter is suitable for being copied into data_storage.

-  As storing is true, precomputations with the Cartier operator will be stored in the Precomputations folder for later use. 
-  For this range of parameters, computing with the first five levels takes around 6 hours.

Using precomputations greatly speeds up the analysis.  The following will compute the dimension of higher powers of the Cartier operator using the file "data1" of precomputations.  

	load tower_data;
	further_computations("Precomputations/data1" : powers:=200, printing:=true);

To directly specify a basic tower with ramification invariant d over the finite field with p^1 elements, use data_collection:
	
	load tower_data;
	p:=3; d:= 7;
	levels:=5;
	data_collection(p,1,d,levels,[[<1,7>]] ,271728 : powers:=1);
	
The [[<1,7>]] indicates that we are analyzing one tower, and the list of terms has one element with coefficient 1 and exponent 7.  Here is the sample output.  (Note that basic towers of the form y^F - y = [x^d] are much faster than other examples.)

	Magma V2.25-6     Tue Jun 15 2021 16:17:10 on mathmagma [Seed = 999518944]
	Type ? for help.  Type <Ctrl>-D to quit.
	Loading "tower_data"
	Loading "tower_computation"
	Loading "gt.m"
	Loading "witt.m"
	Loading "etas.m"
	ASW calculations: 0.160
	Run Number  271728
	Setup 0.350
	Starting Analysis: x^7
	[
	    x^7,
	    0,
	    0,
	    0,
	    0
	]
	Put tower in Standard form: 1.850
	Working on level: 1
	Finished Precomputation: 0.000
	Built Matrix: 0.000
	Computed Invariants: 0.000
	genus, dim ker V^1... [ 6, 4 ]
	Working on level: 2
	Finished Precomputation: 0.000
	Built Matrix: 0.000
	Computed Invariants: 0.000
	genus, dim ker V^1... [ 66, 25 ]
	Working on level: 3
	Finished Precomputation: 0.030
	Built Matrix: 0.000
	Computed Invariants: 0.010
	genus, dim ker V^1... [ 624, 214 ]
	Working on level: 4
	Finished Precomputation: 1.000
	Built Matrix: 0.280
	Computed Invariants: 0.440
	genus, dim ker V^1... [ 5700, 1915 ]
	Working on level: 5
	Precomputed:  716 out of 729 at 1623730935.250
	Finished Precomputation: 329.580
	Built Matrix: 23.770
	Computed Invariants: 82.930
	genus, dim ker V^1... [ 51546, 17224 ]
	<[* 3, 7, x^7, 5, 1, 439.920 *], [
	    [ 6, 4 ],
	    [ 66, 25 ],
	    [ 624, 214 ],
	    [ 5700, 1915 ],
	    [ 51546, 17224 ]
	]>

	Total time: 442.990 seconds, Total memory usage: 2164.81MB

For more general towers, use data_collection_wvs which allows specification of the Witt vector equation.

There is a large archive of already computed towers in data_storage, data_storage2, and data_storage_small.  These can be loaded into magma.  They automatically load data_analysis, which allows viewing the data and comparing it with the conjectures in the paper.

	load data_storage;
	//all towers with p=3 and d=7
	display_data(collected_data, 3, 7);
	
	//look at the deviation from the main term predicted in the paper
	//for the second power of the Cartier operator
	explore_errors(collected_data, 3, 7, 2); 
	
Here is a sample of the latter, exhibiiting periodic behavior of period 2 and lambda = 1/2.	
	
	Tower: x^7 + 2*x^5 + 2*x^2
	dimensions of ker V^ 2 : [ 5, 36, 321, 2872, 25837 ]
	Error: [ 17/16, 9/16, 33/16, 25/16, 49/16 ]
	--------------------

	Tower: x^7
	dimensions of ker V^ 2 : [ 5, 36, 321, 2872, 25837 ]
	Error: [ 17/16, 9/16, 33/16, 25/16, 49/16 ]
	--------------------

	Tower: x^7 + 2*x^5 + x^2
	dimensions of ker V^ 2 : [ 5, 36, 321, 2872, 25837 ]
	Error: [ 17/16, 9/16, 33/16, 25/16, 49/16 ]
	--------------------

	Tower: x^7 + 2*x^5
	dimensions of ker V^ 2 : [ 5, 36, 321, 2872, 25837 ]
	Error: [ 17/16, 9/16, 33/16, 25/16, 49/16 ]
	--------------------


