# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 12:32:24 2024

@author: Mostafa
"""

hours=int(input("Enter Number of worked hours "))
rate=float(input("Enter your rate per hours  "))
#gross =float(hours*rate)
#print("Your gross = ",gross,"$")
consist=40
if(hours > consist):
    Pay_Computations = float(( consist*rate + 1.5*(hours-consist)*rate))
    
else:
    Pay_Computations = float(hours*rate)
    
print("Your pay Computations = ",Pay_Computations,"$")