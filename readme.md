FindTypos
FindTyposs is a script used to read a file and find typos made in this file. the output of the prrogram is a line where error is made, position on the line where error is made, and finally it outputs errors found in the file. This program uses 2 functions. the 1st one is FindFile. The purpose of this function is to fetch all of the files stored in a certain location. The 2nd function is ErrorsInFile. It is used to read files and find typos in them. Typos are stored in an array, and when the file is read by the program and values are found in a file, they are then output by the program.   
VersionsOfLibrary 
VersionsOfLibrary is a script used to get all of the dll files located on the path. It is able to get the file name, product version, and file fullname. If a file contains can be accessed with more than 1 path, the program outputs different fullname for the same file. If he file has different veersions, different versions are in output. This prrogram uses FinFiles function to fetch all files stroed on a location.

Tests
Tests are written for both ErrorsInFiles and FindFiles functions. These tests call the function and test them on a test files. Then test files compare the results with the expected results and the data from the actual output. If the data from the output is the same as the data expected, then it outputs that test is passed. However if the data from the output is not the same as the data expected the test states that the test failed.    