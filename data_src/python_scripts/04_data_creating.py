#!/usr/bin/env python
# coding: utf-8


import pandas as pd
import os

try:
    os.makedirs('../transformed_zone')
except FileExistsError:
    print('Folder already exists')


''' pt locale'''
running_pt = {'name':['Corrida a 6,4 km/h',
                      'Corrida a 6,4 km/h',
                      'Corrida a 7,5 km/h',
                      'Corrida a 7,5 km/h',
                      'Corrida a 8 km/h',
                      'Corrida a 8 km/h',
                      'Corrida a 10 km/h',
                      'Corrida a 10 km/h',
                      'Corrida a 12 km/h',
                      'Corrida a 12 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_running_pt = pd.DataFrame(data=running_pt)


''' es locale '''
running_es = {'name':['Correndo a 6,4 km/h',
                      'Correndo a 6,4 km/h',
                      'Correndo a 7,5 km/h',
                      'Correndo a 7,5 km/h',
                      'Correndo a 8 km/h',
                      'Correndo a 8 km/h',
                      'Correndo a 10 km/h',
                      'Correndo a 10 km/h',
                      'Correndo a 12 km/h',
                      'Correndo a 12 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_running_es = pd.DataFrame(data=running_es)

''' fr locale'''
running_fr = {'name':['Courir à 6,4 km/h',
                      'Courir à 6,4 km/h',
                      'Courir à 7,5 km/h',
                      'Courir à 7,5 km/h',
                      'Courir à 8 km/h',
                      'Courir à 8 km/h',
                      'Courir à 10 km/h',
                      'Courir à 10 km/h',
                      'Courir à 12 km/h',
                      'Courir à 12 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_running_fr = pd.DataFrame(data=running_fr)

''' uk locale'''

running_uk = {'name':['Running at 6.4 km/h',
                      'Running at 6.4 km/h',
                      'Running at 7.5 km/h',
                      'Running at 7.5 km/h',
                      'Running at 8 km/h',
                      'Running at 8 km/h',
                      'Running at 10 km/h',
                      'Running at 10 km/h',
                      'Running at 12 km/h',
                      'Running at 12 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_running_uk = pd.DataFrame(data=running_uk)



df_running_fr,df_running_es,df_running_pt,df_running_uk




with open('../transformed_zone/running_pt.xml', 'w') as running_pt_xml: 
    running_pt_xml.write(df_running_pt.to_xml())



with open('../transformed_zone/running_es.xml', 'w') as running_es_xml: 
    running_es_xml.write(df_running_es.to_xml())



with open('../transformed_zone/running_fr.xml', 'w') as running_fr_xml: 
    running_fr_xml.write(df_running_fr.to_xml())



with open('../transformed_zone/running_uk.xml', 'w') as running_uk_xml: 
    running_uk_xml.write(df_running_uk.to_xml())



''' pt locale'''
walking_pt = {'name':['Caminhada com muletas',
                      'Caminhada com muletas',
                      'Caminhada lenta a 4,5 km/h',
                      'Caminhada lenta a 4,5 km/h',
                      'Caminhada na natureza',
                      'Caminhada na natureza',
                      'Caminhada rápida a 6,5 km/h',
                      'Caminhada rápida a 6,5 km/h',
                      'Caminhada nórdica',
                      'Caminhada nórdica'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_walking_pt = pd.DataFrame(data=walking_pt)


''' es locale '''
walking_es = {'name':['Caminar con muletas',
                      'Caminar con muletas',
                      'Caminata lenta a 4,5 km/h ',
                      'Caminata lenta a 4,5 km/h ',
                      'Paseo por la naturaleza',
                      'Paseo por la naturaleza',
                      'Caminata rápida a 6,5 km/h',
                      'Caminata rápida a 6,5 km/h',
                      'Caminata nórdica',
                      'Caminata nórdica'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_walking_es = pd.DataFrame(data=walking_es)

''' fr locale'''
walking_fr = {'name':['Marcher avec des béquilles',
                      'Marcher avec des béquilles',
                      'Marche lente à 4,5 km/h',
                      'Marche lente à 4,5 km/h',
                      'Promenade dans la nature',
                      'Promenade dans la nature',
                      'Marche rapide à 6,5 km/h',
                      'Marche rapide à 6,5 km/h',
                      'Marche nordique',
                      'Marche nordique'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_walking_fr = pd.DataFrame(data=walking_fr)

''' uk locale'''

walking_uk = {'name':['To walk with crutches',
                      'To walk with crutches',
                      'Slow walking at 4.5 km/h',
                      'Slow walking at 4.5 km/h',
                      'Nature walk',
                      'Nature walk',
                      'Fast walking at 6.5 km/h',
                      'Fast walking at 6.5 km/h',
                      'Nordic walk',
                      'Nordic walk'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_walking_uk = pd.DataFrame(data=walking_uk)



df_walking_uk,df_walking_es,df_walking_pt,df_walking_fr


# In[3]:


with open('../transformed_zone/walking_pt.xml', 'w') as walking_pt_xml: 
    walking_pt_xml.write(df_walking_pt.to_xml())

with open('../transformed_zone/walking_es.xml', 'w') as walking_es_xml: 
    walking_es_xml.write(df_walking_es.to_xml())

with open('../transformed_zone/walking_fr.xml', 'w') as walking_fr_xml: 
    walking_fr_xml.write(df_walking_fr.to_xml())
    
with open('../transformed_zone/walking_uk.xml', 'w') as walking_uk_xml: 
    walking_uk_xml.write(df_walking_uk.to_xml())


''' pt locale'''
cycling_pt = {'name':['Ciclismo em estrada',
                      'Ciclismo em estrada',
                      'Ciclismo de alto impacto',
                      'Ciclismo de alto impacto',
                      'Ciclismo de médio impacto',
                      'Ciclismo de médio impacto',
                      'Passeio de bicicleta a 10 km/h',
                      'Passeio de bicicleta a 10 km/h',
                      'Passeio de bicicleta a 12,5 km/h',
                      'Passeio de bicicleta a 12,5 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_cycling_pt = pd.DataFrame(data=cycling_pt)


''' es locale '''
cycling_es = {'name':['Ciclismo de carretera',
                      'Ciclismo de carretera',
                      'Ciclismo de alto impacto',
                      'Ciclismo de alto impacto',
                      'Ciclismo de medio impacto',
                      'Ciclismo de medio impacto',
                      'Paseo en bicicleta a 10 km/h',
                      'Paseo en bicicleta a 10 km/h',
                      'Paseo en bicicleta a 12,5 km/h',
                      'Paseo en bicicleta a 12,5 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_cycling_es = pd.DataFrame(data=cycling_es)

''' fr locale'''
cycling_fr= {'name':['Cyclisme sur route',
                      'Cyclisme sur route',
                      'Cyclisme à fort impact',
                      'Cyclisme à fort impact',
                      'Cyclisme à impact moyen',
                      'Cyclisme à impact moyen',
                      'Balade à vélo à 10 km/h',
                      'Balade à vélo à 10 km/h',
                      'Balade à vélo à 12,5 km/h',
                      'Balade à vélo à 12,5 km/h'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_cycling_fr = pd.DataFrame(data=cycling_fr)

''' uk locale'''

cycling_uk = {'name':['Road cycling',
                      'Road cycling',
                      'High impact cycling',
                      'High impact cycling',
                      'Medium impact cycling',
                      'Medium impact cycling',
                      'Bike ride at 10 km/h',
                      'Bike ride at 10 km/h',
                      'Bike ride at 12.5 km/h ',
                      'Bike ride at 12.5 km/h '
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_cycling_uk = pd.DataFrame(data=cycling_uk)



df_cycling_uk, df_cycling_es, df_cycling_pt, df_cycling_fr



with open('../transformed_zone/cycling_pt.xml', 'w') as cycling_pt_xml: 
    cycling_pt_xml.write(df_cycling_pt.to_xml())


with open('../transformed_zone/cycling_es.xml', 'w') as cycling_es_xml: 
    cycling_es_xml.write(df_cycling_es.to_xml())



with open('../transformed_zone/cycling_fr.xml', 'w') as cycling_fr_xml: 
    cycling_fr_xml.write(df_cycling_fr.to_xml())


with open('../transformed_zone/cycling_uk.xml', 'w') as cycling_uk_xml: 
    cycling_uk_xml.write(df_cycling_uk.to_xml())



''' pt locale'''
gym_pt = {'name':[    'Treino leve de membros',
                      'Treino leve de membros',
                      'Treino leve de perna',
                      'Treino leve de perna',
                      'Treino pesado de membros',
                      'Treino pesado de membros',
                      'AbSolution (LesMills)',
                      'AbSolution (LesMills)',
                      'BODYATTACK (LesMills)',
                      'BODYATTACK (LesMills)'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_gym_pt = pd.DataFrame(data=gym_pt)


''' es locale '''
gym_es = {'name':[    'Entrenamiento de extremidades ligeras',
                      'Entrenamiento de extremidades ligeras',
                      'Entrenamiento ligero de piernas',
                      'Entrenamiento ligero de piernas',
                      'Entrenamiento de extremidades pesadas',
                      'Entrenamiento de extremidades pesadas',
                      'AbSolution (LesMills)',
                      'AbSolution (LesMills)',
                      'BODYATTACK (LesMills)',
                      'BODYATTACK (LesMills)'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_gym_es = pd.DataFrame(data=gym_es)

''' fr locale'''
gym_fr= {'name':[     'Formation des membres légers',
                      'Formation des membres légers',
                      'Entraînement jambes légères',
                      'Entraînement jambes légères',
                      'Entraînement des membres lourds',
                      'Entraînement des membres lourds',
                      'AbSolution (LesMills)',
                      'AbSolution (LesMills)',
                      'BODYATTACK (LesMills)',
                      'BODYATTACK (LesMills)'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_gym_fr = pd.DataFrame(data=gym_fr)

''' uk locale'''

gym_uk = {'name':[    'Light limb training',
                      'Light limb training',
                      'Light legs training',
                      'Light legs training',
                      'Heavy Limb Training',
                      'Heavy Limb Training',
                      'AbSolution (LesMills)',
                      'AbSolution (LesMills)',
                      'BODYATTACK (LesMills)',
                      'BODYATTACK (LesMills)'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_gym_uk = pd.DataFrame(data=gym_uk)



df_gym_uk,df_gym_pt,df_gym_es,df_gym_fr



with open('../transformed_zone/gym_es.xml', 'w') as gym_es_xml: 
    gym_es_xml.write(df_gym_es.to_xml())



with open('../transformed_zone/gym_pt.xml', 'w') as gym_pt_xml: 
    gym_pt_xml.write(df_gym_pt.to_xml())



with open('../transformed_zone/gym_uk.xml', 'w') as gym_uk_xml: 
    gym_uk_xml.write(df_gym_uk.to_xml())



with open('../transformed_zone/gym_es.xml', 'w') as gym_es_xml: 
    gym_es_xml.write(df_gym_es.to_xml())


''' pt locale'''
group_sports_pt = {'name':['Futebol de 11',
                      'Futebol de 11',
                      'Futsal',
                      'Futsal',
                      'Basquetebol',
                      'Basquetebol',
                      'Voleibol',
                      'Voleibol',
                      'Andebol',
                      'Andebol'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_group_sports_pt = pd.DataFrame(data=group_sports_pt)


''' es locale '''
group_sports_es = {'name':[ 'Fútbol 11',
                      'Fútbol 11',
                      'Fútbol sala',
                      'Fútbol sala',
                      'Baloncesto',
                      'Baloncesto',
                      'Vóleibol',
                      'Vóleibol',
                      'Balonmano',
                      'Balonmano'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_group_sports_es = pd.DataFrame(data=group_sports_es)

''' fr locale'''
group_sports_fr= {'name':[     'Foot 11',
                      'Foot 11',
                      'Foot en salle',
                      'Foot en salle',
                      'Basket-ball',
                      'Basket-ball',
                      'Volley-ball',
                      'Volley-ball',
                      'Handball',
                      'Handball'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_group_sports_fr = pd.DataFrame(data=group_sports_fr)

''' uk locale'''

group_sports_uk = {'name':[    'Football',
                      'Football',
                      'Footsall',
                      'Footsall',
                      'Basket-ball',
                      'Basket-ball',
                      'Volley-ball',
                      'Volley-ball',
                      'Hand-ball',
                      'Hand-ball'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_group_sports_uk = pd.DataFrame(data=group_sports_uk)



df_group_sports_uk, df_group_sports_fr,df_group_sports_pt,df_group_sports_es



with open('../transformed_zone/group_sports_pt.xml', 'w') as group_sports_pt_xml: 
    group_sports_pt_xml.write(df_group_sports_pt.to_xml())



with open('../transformed_zone/group_sports_es.xml', 'w') as group_sports_es_xml: 
    group_sports_es_xml.write(df_group_sports_es.to_xml())



with open('../transformed_zone/group_sports_fr.xml', 'w') as group_sports_fr_xml: 
    group_sports_fr_xml.write(df_group_sports_fr.to_xml())



with open('../transformed_zone/group_sports_uk.xml', 'w') as group_sports_uk_xml: 
    group_sports_uk_xml.write(df_group_sports_uk.to_xml())



''' pt locale'''
swimming_pt = {'name':['Natação de baixo impacto',
                      'Natação de baixo impacto',
                      'Natação backstroke',
                      'Natação backstroke',
                      'Natação butterfly',
                      'Natação butterfly',
                      'Natação de médio impacto',
                      'Natação de médio impacto',
                      'Natação de lazer',
                      'Natação de lazer'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}

df_swimming_pt = pd.DataFrame(data=swimming_pt)


''' es locale '''
swimming_es = {'name':[ 'Natación de bajo impacto',
                      'Natación de bajo impacto',
                      'Natación backstroke',
                      'Natación backstroke',
                      'Natación butterfly',
                      'Natación butterfly',
                      'Natación de medio impacto',
                      'Natación de medio impacto',
                      'Natación de ocio',
                      'Natación de ocio'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_swimming_es = pd.DataFrame(data=swimming_es)

''' fr locale'''
swimming_fr= {'name':['Natation à faible impact',
                      'Natation à faible impact',
                      'Nage à backstroke',
                      'Nage à backstroke',
                      'Nage à butterfly',
                      'Nage à butterfly',
                      'Nage à impact moyen',
                      'Nage à impact moyen',
                      'Natation de loisir',
                      'Natation de loisir'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_swimming_fr = pd.DataFrame(data=swimming_fr)

''' uk locale'''

swimming_uk = {'name':['Low impact swimming',
                      'Low impact swimming',
                      'Backstroke swimming',
                      'Backstroke swimming',
                      'Butterfly swimming',
                      'Butterfly swimming',
                      'Medium impact swimming',
                      'Medium impact swimming',
                      'Recreational swimming',
                      'Recreational swimming'
                     ],
              'duration': [15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30,
                           15,
                           30]}
df_swimming_uk = pd.DataFrame(data=swimming_uk)



df_swimming_uk, df_swimming_pt, df_swimming_es,df_swimming_fr


with open('../transformed_zone/swimming_pt.xml', 'w') as swimming_pt_xml: 
    swimming_pt_xml.write(df_swimming_pt.to_xml())


with open('../transformed_zone/swimming_es.xml', 'w') as swimming_es_xml: 
    swimming_es_xml.write(df_swimming_es.to_xml())


with open('../transformed_zone/swimming_fr.xml', 'w') as swimming_fr_xml: 
    swimming_fr_xml.write(df_swimming_fr.to_xml())



with open('../transformed_zone/swimming_uk.xml', 'w') as swimming_uk_xml: 
    swimming_uk_xml.write(df_swimming_uk.to_xml())