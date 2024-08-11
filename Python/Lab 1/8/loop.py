# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 13:40:23 2024

@author: Mostafa
"""

arr=[10,20,30,40,50,60]
count=len(arr)
sum_=0
for i in arr:
    sum_=arr[i]+sum_

avg=sum_/count
print("Avg = ",avg)