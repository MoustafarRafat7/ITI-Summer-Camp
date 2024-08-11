# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 18:08:23 2024

@author: Mostafa
"""

Master = input ("Enter 1 if you Got Master :    ");
MBA = input ("Enter 1 if you Got MBA :    ");
GPA = float(input("Enter  Your GPA  : "));
Exprience = float (input("Enter years of experience: "));

if (GPA>3.8):
    if (Master == 1):
        if(MBA == 1):
                if(Exprience > 15):
                    print("Manger");
                elif(15 >= Exprience > 10):
                    print("Staff Senior");
                elif(10 >= Exprience > 5):
                    print("Senior");
                elif(10 >= Exprience > 3):
                    print("TeamleaderSenior");
                elif(10 >= Exprience > 1):
                    print("Standard");
                elif(10 >= Exprience < 1):
                    print("Junior");
                else:
                    print("Not Listed");
                
        elif(MBA == 0):
                if(15 >= Exprience > 10):
                    print("Staff Senior");
                elif(10 >= Exprience > 5):
                    print("Senior");
                elif(10 >= Exprience > 3):
                    print("TeamleaderSenior");
                elif(10 >= Exprience > 1):
                    print("Standard");
                elif(10 >= Exprience < 1):
                    print("Junior");
                else:
                    print("Not Listed");
            
        else:
            print("Not Listed");
    
    elif (Master == 0):
        if(10 >= Exprience > 5):
            print("Senior");
        elif(10 >= Exprience > 3):
            print("TeamleaderSenior");
        elif(10 >= Exprience > 1):
            print("Standard");
        elif(10 >= Exprience < 1):
            print("Junior");
        else:
            print("Not Listed");
        
        
    else:
        print("Not Listed");
    
elif (GPA>3.6):
    if (Master == 1):
                if(15 >= Exprience > 10):
                    print("Staff Senior");
                elif(10 >= Exprience > 5):
                    print("Senior");
                elif(10 >= Exprience > 3):
                    print("TeamleaderSenior");
                elif(Exprience > 1):
                    print("Standard");
                elif(Exprience < 1):
                    print("Junior");
                else:
                    print("Not Listed");
       
    
    elif (Master == 0):
                if(10 >= Exprience > 5):
                    print("Senior");
                elif(10 >= Exprience > 3):
                    print("TeamleaderSenior");
                elif(10 >= Exprience > 1):
                    print("Standard");
                elif(10 >= Exprience < 1):
                    print("Junior");
                else:
                    print("Not Listed");
        
        
    else:
                print("Not Listed");
    
    
    
elif (GPA>3.4):
    if(10 >= Exprience > 3):
        print("TeamleaderSenior");
    elif(Exprience > 1):
        print("Standard");
    elif(Exprience < 1):
        print("Junior");
    else:
        print("Not Listed");

elif (GPA>3):
    if(Exprience > 1):
        print("Standard");
    elif(Exprience < 1):
        print("Junior");
    else:
        print("Not Listed");
elif (GPA>2.5):
    if(Exprience < 1):
        print("Junior");
    else:
        print("Not Listed");
else :
    print("Not Listed");