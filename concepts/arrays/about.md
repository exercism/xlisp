# About

In Common Lisp like other languages an array is a set of elements which are accessed via integral indexes.
The types of the elements can be heterogeneous.
The array can be multi-dimensional (not simply 1-dimensional).

Arrays can be created with `make-array` which takes an argument for defining size of each dimension of the array.
It also can take arguments to define the values to initialize the array with.

## Accessing Elements

With `aref` elements can be accessed via a series of indexes which specify the element.
An element can also be accessed with `row-major-aref` which takes a single integer specifying the element in row-major order.
(The row-major index can be computed from the indexes via `array-row-major-index`.)

## Queries about Arrays

Various information about an array may be retrieved with the following functions:

* `array-rank` to get the number of dimensions of the array (referred to as the array's rank).
* `array-dimensions` to get a list of the sizes of the array's dimensions.
* `array-dimension` to get the size of one of the dimensions.
* `array-total-size` to get total number of elements in the array.

## Limits on the Size of Arrays

The Common Lisp Standard defines some limits on the maximum size of arrays.
These limits are available in some defined constants: 

* `array-rank-limit`: the maximum allowed number of dimensions of an array (defined to be no smaller than 8).
* `array-dimension-limit`: the maximum size of any one dimension (defined to be no smaller than 1024).
* `array-total-size-limit`: the maximum number of elements of any array (define to be no smaller than 1024).



