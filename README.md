# fiftyfive-exam
Recruiting exam for fiftyfive



Here are two sample files : 

File1 : slash separated paths
A/B/C : 1
A/B : 1
A1/B1/C : 1

File2 : dot or slash separated paths
A.C : 1
A.B : 1
A.B.D : 3
A.B.C : 1
A2/B/C : 4

Expected result : 
A : 8
A/B : 7
A/B/C : 2
A/B/D : 3
A/C : 1
A1 : 1
A1/B1 : 1
A1/B1/C : 1
A2 : 4
A2/B : 4 
A2/B/C : 4

We want to merge the two trees and generate a full layout of the tree.
We would like to have a test case which will load two files, merge the two trees and generate a full description of the tree.
The code should be written in objective-c