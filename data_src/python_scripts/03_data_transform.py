#!/usr/bin/env python
# coding: utf-8


import pandas as pd
import os
import csv


foods_pt = pd.read_csv("../cleaned_zone/foods_pt.csv", delimiter = '\t', dtype=str)
foods_es = pd.read_csv("../cleaned_zone/foods_es.csv", delimiter = '\t', dtype=str)
foods_fr = pd.read_csv("../cleaned_zone/foods_fr.csv", delimiter = '\t', dtype=str)
foods_uk = pd.read_csv("../cleaned_zone/foods_uk.csv", delimiter = '\t', dtype=str)


try:
    os.makedirs('../transformed_zone')
except FileExistsError:
    print('Folder already exists')



foods_pt = foods_pt.rename(columns={"energy-kcal_100g":"energy_kcal_100g"})
foods_es = foods_es.rename(columns={"energy-kcal_100g":"energy_kcal_100g"})
foods_fr = foods_fr.rename(columns={"energy-kcal_100g":"energy_kcal_100g"})
foods_uk = foods_uk.rename(columns={"energy-kcal_100g":"energy_kcal_100g"})


#create xml files from csv ones

with open('../transformed_zone/foods_pt.xml', 'w') as foods_pt_xml: 
    foods_pt_xml.write(foods_pt.to_xml())

with open('../transformed_zone/foods_es.xml', 'w') as foods_es_xml: 
    foods_es_xml.write(foods_es.to_xml())

with open('../transformed_zone/foods_fr.xml', 'w') as foods_fr_xml: 
    foods_fr_xml.write(foods_fr.to_xml())

with open('../transformed_zone/foods_uk.xml', 'w') as foods_uk_xml: 
    foods_uk_xml.write(foods_uk.to_xml())