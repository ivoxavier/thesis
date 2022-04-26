#!/usr/bin/env python
# coding: utf-8

# ivofernandes thesis 

#install dependencies
import wget
import os

os.system("pip install wget")
#create path for landing_zone
try:
    #this is folder is ignored in .gitignore
    os.makedirs('../landing_zone')
    print('landing_zone created')
except FileExistsError:
    print('folder already exists\n')
    try:
        print('deleting leftovers...\n')
        os.remove('../landing_zone/foods.csv')
    except:
        print('something went wrong, please verify locally')
            
try:
    print('Pulling data..')
    os.system("wget -O ../landing_zone/foods.csv 'https://static.openfoodfacts.org/data/en.openfoodfacts.org.products.csv'")
except:
    print('error')





