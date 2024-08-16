# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 20:15:26 2024

@author: Mostafa

Company System using Dict
"""

Employees_Name =[]
Employees_Salary=[]
Employees_Departement=[]
Employees_ID=[]

Employees={"Names":Employees_Name,
           "Salary":Employees_Salary,
           "Departement":Employees_Departement,
           "ID":Employees_ID}

while 1:
    process=int(input("Choose Process no:\n1- Add Employee \n2- Search on Empolyee\n3- Delete Employee\n4- Show all Employes\n5-Quit\n"))
    if(process == 1):
                Employee_Name=input("Enter Employee Name: ")
                Employee_Salary=input("Enter Employee Salary: ")
                Employee_Departement=input("Enter Employee Departement : ")
                Employee_ID=input("Enter Employee ID: ")
                Employees_Name.append(Employee_Name)
                Employees_Salary.append(Employee_Salary)
                Employees_Departement.append(Employee_Departement)
                Employees_ID.append(Employee_ID)
                
    elif(process == 2):
        Search_Employee=input("Enter Employee Name you want to search for :  ")
        for Employees in Employees_Name:
            if(Employees == Search_Employee ):
                Found=1
                break
            else:
                Found=0
        if(Found == 1):
            print("Employee Found.")
        else:
            print("Employee Not Found!")
    elif(process == 3):
         Search_Employee=input("Enter Employee Name you want to Delete :  ")
         for Employees in Employees_Name:
             if(Employees == Search_Employee ):
                 index=Employees_Name.index(Employees)
                 Found=1
                 break
             else:
                 Found=0
         if(Found == 1):
             print("Employee Found and deleted.")
             Employees_Name.pop(index)
             Employees_Salary.pop(index)
             Employees_Departement.pop(index)
             Employees_ID.pop(index) 
         else:
             print("Employee Not Found!")       
    
    elif(process == 4):
        Search_Employee=input("Enter Employee Name you want to show his data :  ")
        for Employees in Employees_Name:
            if(Employees == Search_Employee ):
                 index=Employees_Name.index(Employees)
                 print(f"Employee_Name: {Employees_Name[index]}")
                 print(f"Employee_Salary: { Employees_Salary[index]}")
                 print(f"Employee_Departement: {Employees_Departement[index]}")
                 print(f"Employee_ID: {Employees_ID[index]}")
    elif(process == 5):
        break
        