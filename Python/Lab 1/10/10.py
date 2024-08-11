# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 14:04:21 2024

@author: Mostafa
"""

arr= [9, 41, 12, 3, 74, 15] 
i=0
temp=arr[0]
while i<6:
    if arr[i]<temp:
        temp=arr[i]
    i=i+1
print("",temp)