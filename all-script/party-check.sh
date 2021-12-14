#!/bin/bash

#Knowledge check 2
 
#write a script that will be use to direct guest at a party.
#the guest are from 5 state 
#Texas, Virginia, Geogia , Delaware and Nevada
#Each state will have 3 tables per age group.
#Table1= for people in the range of 15 and 20 years old
#Table2 = for 21 to 80 years old
#Table3 = above 80 years Old
#If anyone is less than 15 years old, they should go home.
#The script will ask guest what state they are from and 
#their age and base on the answer, the script should 
#direct them (example: follow texas table 1 direction)
#

#!/bin/bash

echo "Which is state are you from?"
read state

if [ $state = Texas ] || [ $state = Virginia ] || [ $state = Geogia ] || [ $state = Delaware ] || [ $state = Nevada ]
then
        echo "your state is welcome to party"
else
        echo "provide a valide state"
        exit 0
Fi

echo "How old are you"
read age

if [ $age -ge 15 ] && [ $age -le 20 ]
then
        echo "Table 1" 
elif [ $age -ge 21 ] && [ $age -le 80 ]
then
        echo "Table 2"
elif [ $age -ge 81  ]
then
        echo "Table 3"
else
        echo "go home"
fi