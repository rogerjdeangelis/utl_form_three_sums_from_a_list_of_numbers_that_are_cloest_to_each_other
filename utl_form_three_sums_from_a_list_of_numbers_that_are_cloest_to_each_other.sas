Form three sums from a list of numbers that are cloest to each other

Minimun coeficient of variation was use to determine closest.

I do not solve the general case but examine all groups of 3 from a list of 4 numbers.
This is a enumeration problem which probably requires eary terminations to be comutationally
psiible. Looks like a knapsack problem.  (ncomb and lexcomb may help)


INPUT
=====                        Indes
                             1 2 3 4
 array nums[4] _temporary_  (2 3 5 7);

 EXAMPLE OUTPUT
 --------------

 WORK.WANT total obs=4

  IDX    S1    S2    S3       CV

   1      2     8     7    56.7274
   2      3    12     2    97.1924
   3      5     9     3    53.9127
                                    **  inexes   4    1 2   3
   4      7     5     5    20.3771  **  closest (7 + (2+3) +5


PROCESS
=======

 data want;
   array nums[4] _temporary_  (2 3 5 7);
   * 4 chose 1;
   do i=1 to 4;
     idx=mod(i-1,4)+1;
     s1=nums(mod(i-1,4)+1);
     s2=sum(nums(mod(idx,4)+1),sum(nums(mod(idx+1,4)+1)));
     s3=nums(mod(idx+2,4)+1);
     cv=cv(s1,s2,s3);
     drop i;
     output;
   end;
 run;quit;

OUTPUT (Same as above)
======

 WORK.WANT total obs=4

  IDX    S1    S2    S3       CV

   1      2     8     7    56.7274
   2      3    12     2    97.1924
   3      5     9     3    53.9127    *  inexes   4    1 2   3
   4      7     5     5    20.3771    ** closest (7 + (2+3) +5





