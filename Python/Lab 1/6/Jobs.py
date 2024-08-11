# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 12:54:13 2024

@author: Mostafa
"""
Job_Title=0
MBA=int(input("Enter 1 if you Got MBA"))
Master=int(input("Enter 1 if you Got Master"))
GPA = float(input("Enter Your GPA"))
Experience=int(input("Enter Number of years of Experience"))

if Master==1:
    if MBA==1:
        if GPA>3.8:
            if Experience>15:
                   Job_Title="Manager"
            else:
                Job_Title="Not listed"
    elif GPA>3.6:
        if Experience<=15 and Experience>10 :
           Job_Title="Staff_senior"
        else:
             Job_Title="Not listed"
    else:
           Job_Title="Not listed"
elif GPA >3.6:
    if Experience<=10 and Experience >5 and MBA==0:
        Job_Title="Senior"
    else:
         Job_Title="Not listed"
elif GPA >3.4:
    if Experience<=10 and Experience >3 and MBA==0:
        Job_Title="TeamleaderSenior"  
    else:
         Job_Title="Not listed"
elif GPA >3:
    if Experience >1 and MBA==0:
        Job_Title="Standard"  
    else:
        Job_Title="Not listed"
elif GPA >2.5:
    if Experience <1 and MBA==0:
        Job_Title="junior"
    else:
                Job_Title="Not listed"
else:
    Job_Title="Not listed"
    
            
print("",Job_Title)
                  

                   