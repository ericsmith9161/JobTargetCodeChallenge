# Job Target Coding Challenge #
## Eric Smith ##

### Assignment ###

Given a text file containing rows of space separated integers representing a 
triangle, find the way of traversing down the triangle from the top row resulting
in the highest sum

### Implementation ###

* Begin by parsing the text file, and storing its values as a 2d array full of integers
* Using memoization, build a hash that stores the max sum at each space of the triangle
	* For each space, the max sum will be the max of the max sums of the previous row at the same index and the previous row at the previous index
* After completing our memo, find the max sum of all of the locations in the bottom row of the triangle, and return.

* The given `triangle.txt` has a max sum of 732,506

### To Run ###

* In the console, execute `ruby triangle.rb`
* If there are other triangles you'd like to run the program with, change
the text file on line 50 of the `triangle.rb` file