# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 13:26:01 2024

@author: Mostafa
"""

Password=2030
Balance=float(10000)
print("Welcome to our Bank\n")   
while 1:    
    User_Password=int(input("Please, Enter your 4-Digit PIN Number :   ")) 
    if(Password==User_Password):
        print("Welcome Moustafa \n")
        print("1- Withdraw\n2- Balance Inquiry \n3- Fast Cash \n4- quit")
        Process=int(input("Choose Process:  "))
        if(Process == 1):
            while(1):
                Amount=int(input("Enter Withdraw Amount(Multiple of 100) :  "))
                if( (Amount%100) == 0):
                    Remaining_Balance=Balance-Amount
                    print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                    print("Process Done Successfully")
                    print("The remaining Balance=  ",Remaining_Balance,"$")
                    
                    break
                else:
                    print("Not Valid Amount,Please Enter (Multiple of 100)")
        elif(Process == 2):
            print("Your Balance =  ",Balance,"$")
        elif(Process == 3):
            while(1):
                choice=int(input("1- 500$\n2- 1000$ \n3- 5000$ \n4- 10000$ \n5- 50000$\n"))
                if(choice == 1):
                    cash=500
                    if(cash >Balance):
                        print("Insufficient Balance,Please Choose other choice ")
                    else:
                        Remaining_Cash=Balance-cash  
                        print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                        print("Process Done Successfully")
                        print("The remaining Balance=  ",Remaining_Cash,"$")
                        break
                elif(choice == 2):
                    cash=1000
                    if(cash >Balance):
                        print("Insufficient Balance,Please Choose other choice ")
                    else:
                       Remaining_Cash=Balance-cash  
                       print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                       print("Process Done Successfully")
                       print("The remaining Balance=  ",Remaining_Cash,"$")
                       break
                elif(choice == 3):
                   cash=5000
                   if(cash >Balance):
                       print("Insufficient Balance,Please Choose other choice ")
                   else:
                      Remaining_Cash=Balance-cash  
                      print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                      print("Process Done Successfully")
                      print("The remaining Balance=  ",Remaining_Cash,"$")
                      break
                elif(choice == 4):
                   cash=10000
                   if(cash >Balance):
                       print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                       print("Process Done Successfully")
                       print("Insufficient Balance,Please Choose other choice ")
                   else:
                      Remaining_Cash=Balance-cash  
                      print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                      print("Process Done Successfully")
                      print("The remaining Balance=  ",Remaining_Cash,"$")
                      break   
                  
                elif(choice == 5):
                   cash=50000
                   if(cash >Balance):
                       
                       print("Insufficient Balance,Please Choose other choice ")
                   else:
                      Remaining_Cash=Balance-cash  
                      print("TRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\n")
                      print("Process Done Successfully")
                      print("The remaining Balance=  ",Remaining_Cash,"$")
                      break
        elif(Process == 4):
            print("Logged Out")  
            break
        else:
            print("Invalid \n")
            break
    else:
        print("Wrong PIN Please Try again Later")

    



