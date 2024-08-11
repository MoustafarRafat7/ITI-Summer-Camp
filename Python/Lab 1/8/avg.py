# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 13:40:23 2024

@author: Mostafa
"""

arr=[10,20,30,40,50,60]
count=len(arr)
sum_=0
i=0
while i<6:
    sum_=arr[i]+sum_
    i=i+1
avg=sum_/count
print("Avg = ",avg)