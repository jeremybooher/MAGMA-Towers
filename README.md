# Invariants of Curves in Zp Towers over Finite Fields

This repository provides [MAGMA](http://magma.maths.usyd.edu.au/magma/) programs for computing with differentials on Zp-towers of curves totally ramified over one point of the projective line over a finite field of characteristic p.  It is used extensively in the paper "Geometric Iwasawa Theory for Zp-Towers of Curves in Characteristic p" by Jeremy Booher and Bryden Cais; that paper also includes an overview of the method and the mathematics underlying it.  While it is orders-of-magnitude faster than the generic methods provided for function fields in MAGMA, individual interesting examples still require many hours to run.  This repository also stores the results of many examples (mostly in characteristic two and three) and includes functionality to analyze them.

It uses code for computing with Witt Vectors developed by Luis Finotti ([github repository](https://github.com/lrfinotti/witt)).

# Files

- tower_computation provides basic methods for describing curves in a Zp tower of curves over a field of charactersitic p totally ramified at one point and for computing with the Cartier operator on the space of regular differentials.

- tower_data uses tower_computation to collect data about the a-number and dimension of the kernel of powers of the Cartier operator on the space of regular differentials for Zp towers with specified ramification.

- example_finder will select interesting examples of Zp towers where the anumber of the first level takes on different values, and then collects data up the tower.  (It also includes functions for dealing with Z/pZ covers.)

- data_storage stores the results of the computations (copied and pasted as they are run), as individual examples can take several days.  The main results are collected_data, while higher_powers includes a few examples which treat very large powers of the Cartier operator.

- data_storage_small stores many more examples where fewer levels of the tower are analyzed.

- data_analysis provides some functions for analyzing the stored computations, producing tables, and checking conjectures.

- 

# Theory

See "Geometric Iwasawa Theory for Zp-Towers of Curves in Characteristic p" by Jeremy Booher and Bryden Cais.

# Usage



