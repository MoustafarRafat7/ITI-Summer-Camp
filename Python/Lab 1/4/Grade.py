# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 12:21:43 2024

@author: Mostafa
"""

Score = int( input ( "Enter Your Grade ") )

if Score <=100 and Score >85 :
        Grade = 'A'
elif Score <=85 and Score >75 :
                Grade = 'B'
elif Score <=75 and Score >65 :
                Grade = 'C'
elif Score <=65 and Score >60 :
                Grade = 'D'
else:
                Grade = 'F'
                
print ("Your Grade is : ",Grade)
        
        