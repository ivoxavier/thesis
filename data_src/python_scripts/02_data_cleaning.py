#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np
import os


#Neither the mobile app can't deal with big files, neither pandas can't open such massive loads. 
#100000.
raw_foods = pd.read_csv("../landing_zone/foods.csv", delimiter = '\t', dtype=str, nrows = 100000)


#make imported file as DataFrame
df_raw_foods = pd.DataFrame(raw_foods)


df_raw_foods.info()


drop_unwanted_columns = df_raw_foods.drop(['url',
                'code',                           
                'creator',
                'created_t',
                'created_datetime',
                'last_modified_t',
                'last_modified_datetime',
                'abbreviated_product_name',
                'generic_name',
                'packaging',
                'packaging_tags',
                'packaging_text',
                'brands',
                'brands_tags',
                'categories',
                'categories_tags',
                'origins',
                'origins_tags',
                'origins_en',
                'manufacturing_places',
                'manufacturing_places_tags',
                'labels',
                'labels_tags',
                'labels_en',
                'emb_codes',
                'emb_codes_tags',
                'cities',
                'cities_tags',
                'purchase_places',
                'stores',
                'ingredients_text',
                'allergens',
                'allergens_en',
                'traces',
                'traces_tags',
                'traces_en',
                'no_nutriments',
                'additives_n',
                'additives_tags',
                'additives_en',
                'additives',
               # 'ingredients_that_may_be_from_palm_oil_n',
               # 'ingredients_that_may_be_from_palm_oil',
               # 'ingredients_that_may_be_from_palm_oil_tags',
               # 'ingredients_from_palm_oil_n',
               #  'ingredients_from_palm_oil',
               # 'ingredients_from_palm_oil_tags',
                'states_en',
                'states_tags',
                'states',
                'brand_owner',
                'main_category',
                'image_url',
                'image_small_url',
                'image_nutrition_url',
                'image_nutrition_small_url',
                'image_ingredients_url',
                'image_ingredients_small_url',
                '-butyric-acid_100g',
                '-caproic-acid_100g',
                '-caprylic-acid_100g',
                '-capric-acid_100g',
                '-lauric-acid_100g',
                '-myristic-acid_100g',
                '-palmitic-acid_100g',
                '-stearic-acid_100g',
                '-arachidic-acid_100g',
                '-behenic-acid_100g',
                '-lignoceric-acid_100g',
                '-cerotic-acid_100g',
                '-montanic-acid_100g',
                '-melissic-acid_100g',
                '-alpha-linolenic-acid_100g',
                '-eicosapentaenoic-acid_100g',
                '-docosahexaenoic-acid_100g',
                '-linoleic-acid_100g',
                '-arachidonic-acid_100g',
                '-gamma-linolenic-acid_100g',
                '-oleic-acid_100g',
                '-gondoic-acid_100g',
                '-mead-acid_100g',
                '-erucic-acid_100g',
                '-nervonic-acid_100g',
                '-dihomo-gamma-linolenic-acid_100g',
                '-elaidic-acid_100g',
                'starch_100g',
                'polyols_100g',
                '-maltodextrins_100g',
                #'-soluble-fiber_100g',
                #'-insoluble-fiber_100g',
                'casein_100g',
                'serum-proteins_100g',
                'nucleotides_100g',
                'beta-carotene_100g',
                'folates_100g',
                'biotin_100g',
                'pantothenic-acid_100g',
                'bicarbonate_100g',
                'silica_100g',
                'chloride_100g',
                'copper_100g',
                'fluoride_100g',
                'chromium_100g',
                'selenium_100g',
                'molybdenum_100g',
                'fruits-vegetables-nuts_100g',
                'fruits-vegetables-nuts-dried_100g',
                'fruits-vegetables-nuts-estimate_100g',
                'collagen-meat-protein-ratio_100g',
                'cocoa_100g',
                'chlorophyl_100g',
                'taurine_100g',
                'carbon-footprint_100g',
                'carbon-footprint-from-meat-or-fish_100g',
                'trans-fat_100g',
                'nutrition-score-fr_100g',
                'nutrition-score-uk_100g',
                'glycemic-index_100g',
                'choline_100g',
                'phylloquinone_100g',
                'beta-glucan_100g',
                'inositol_100g',
                'carnitine_100g',
                'monounsaturated-fat_100g',
                'polyunsaturated-fat_100g',
                '-sucrose_100g',
                'pnns_groups_1',
                'pnns_groups_2',
                '-maltose_100g',
                'first_packaging_code_geo',
                'serving_size',
                'serving_quantity',
                'nova_group',
                'vitamin-pp_100g',
                'energy-from-fat_100g',
                'energy-kj_100g',
                'energy_100g',
                'quantity',
                'categories_en',
                'nutriscore_score',
               # 'ecoscore_score_fr',
               # 'ecoscore_grade_fr',
                'omega-9-fat_100g',
                '-lactose_100g',
                '-glucose_100g',
                '-fructose_100g',
                'water-hardness_100g',
                'omega-6-fat_100g',
                'caffeine_100g',
                'iron_100g',
                'manganese_100g',
                'phosphorus_100g',
                'alcohol_100g',
                'omega-3-fat_100g',
                'magnesium_100g',
                'iodine_100g',
                'zinc_100g',
                'calcium_100g',
                'potassium_100g',
                'vitamin-a_100g',
                'vitamin-b1_100g',
                'vitamin-c_100g',
                'vitamin-b12_100g',
                'vitamin-d_100g',
                'vitamin-e_100g',
                'vitamin-k_100g',
                'vitamin-b2_100g',
                'vitamin-b6_100g',
                'vitamin-b9_100g',
                'sodium_100g',
                'ph_100g',
                'cholesterol_100g',
                'countries',
                'countries_tags',
                'salt_100g',
                'fiber_100g',
                'sugars_100g', 
                'ingredients_tags',
                'packaging_en',
                'food_groups',
                'food_groups_tags',
                'food_groups_en',
                'ecoscore_grade',
                'ecoscore_score',
                'saturated-fat_100g',
                'insoluble-fiber_100g',
                'fruits-vegetables-nuts-estimate-from-ingredients_100g',
                'soluble-fiber_100g',
                'main_category_en'], axis = 1) # axis 0 = rows , axis 1 = columns


drop_unwanted_columns.info()

#filter None values on product_name
clean_product_name = drop_unwanted_columns.dropna(subset=['product_name'])
clean_product_name['product_name'].unique().tolist()




#filter None values on countries_en
clean_countries = clean_product_name.dropna(subset=['countries_en'])
clean_countries['countries_en'].unique().tolist()



#replace null values on nutriscore_grade
clean_nutriscore_grade = clean_countries.dropna(subset=['nutriscore_grade'])



#replace null values by zer0

clean_energy_kcal_100g = clean_nutriscore_grade.dropna(subset=['energy-kcal_100g'])

clean_fat_100g = clean_energy_kcal_100g.fillna({'fat_100g': 0})

clean_carbohydrates_100g = clean_fat_100g.fillna({'carbohydrates_100g': 0})

clean_proteins_100g = clean_carbohydrates_100g.fillna({'proteins_100g': 0})



#filter for the localization supported in the utFoods app

filter_pt  =  clean_proteins_100g[clean_proteins_100g.countries_en == 'Portugal'] 
filter_es  =  clean_proteins_100g[clean_proteins_100g.countries_en == 'Spain'] 
filter_fr  =  clean_proteins_100g[clean_proteins_100g.countries_en == 'France'] 
filter_uk  =  clean_proteins_100g[clean_proteins_100g.countries_en == 'United Kingdom']



filter_pt.duplicated(['product_name']).unique().tolist()


filter_es.duplicated((['product_name'])).unique().tolist()



filter_fr.duplicated((['product_name'])).unique().tolist()


filter_uk.duplicated((['product_name'])).unique().tolist()


drop_duplicates_pt = filter_pt.drop_duplicates(['product_name'])
drop_duplicates_es = filter_es.drop_duplicates(['product_name'])
drop_duplicates_fr = filter_fr.drop_duplicates(['product_name'])
drop_duplicates_uk = filter_uk.drop_duplicates(['product_name'])


#save a copy seperated
def write_csv():
    try:
        os.makedirs('../cleaned_zone')
        drop_duplicates_pt.to_csv('../cleaned_zone/foods_pt.csv',index = False,sep='\t')
        drop_duplicates_es.to_csv('../cleaned_zone/foods_es.csv',index = False,sep='\t')
        drop_duplicates_fr.to_csv('../cleaned_zone/foods_fr.csv',index = False,sep='\t')
        drop_duplicates_uk.to_csv('../cleaned_zone/foods_uk.csv',index = False,sep='\t')
        print('Save completed')
    except FileExistsError:
        drop_duplicates_pt.to_csv('../cleaned_zone/foods_pt.csv',index = False,sep='\t')
        drop_duplicates_es.to_csv('../cleaned_zone/foods_es.csv',index = False,sep='\t')
        drop_duplicates_fr.to_csv('../cleaned_zone/foods_fr.csv',index = False,sep='\t')
        drop_duplicates_uk.to_csv('../cleaned_zone/foods_uk.csv',index = False,sep='\t')
        print('Save completed')
    
try:
    os.remove('../cleaned_zone/foods_pt.csv')
    os.remove('../cleaned_zone/foods_es.csv')
    os.remove('../cleaned_zone/foods_fr.csv')
    os.remove('../cleaned_zone/foods_uk.csv')
    write_csv()
except:
    write_csv()