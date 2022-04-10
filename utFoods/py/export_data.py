'''
 * 2022  Ivo Fernandes <pg27165@alunos.uminho.pt>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * utFoods is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 '''
import csv
import os
import sqlite3
import time
import pyotherside

class ExportData():

    def moduleState():
        return 'Python Module Imported'
    

    def createPath():
        mobile_path = '/home/phablet/Documents/utFoods_exports'
        access_rights = 0o755
        try:
            os.mkdir(mobile_path, access_rights)
        except FileExistsError:
            return 'create_path_failed'
        return 'path_created'


    def createCSVFile():
        csv_ingestions_table = '/home/phablet/Documents/utFoods_exports/utFoods_ingestions_table.csv'
        csv_user_table = '/home/phablet/Documents/utFoods_exports/utFoods_user_table.csv'
        csv_weight_tracker_table = '/home/phablet/Documents/utFoods_exports/utFoods_weight_tracker_table.csv'
        csv_water_tracker_table = '/home/phablet/Documents/utFoods_exports/utFoods_water_tracker_table.csv'
        csv_sport_table =  '/home/phablet/Documents/utFoods_exports/utFoods_sport_tracker_table.csv'
        all_files = [csv_user_table,
        csv_ingestions_table,
        csv_water_tracker_table,
        csv_weight_tracker_table,
        csv_sport_table]
        
        for i in all_files:
            try:
                os.remove(i)
            except FileExistsError:
                return 'file_not_deleted_or_not_existant'
        
        for i in all_files:
            try:
                each_file = open(i, 'w')
                each_file.close()
            except FileExistsError:
                return 'file_not_deleted_or_not_existant'
        return 'file_deleted'

    
    
    def userTable():
        csv_user_table = '/home/phablet/Documents/utFoods_exports/utFoods_user_table.csv'
        pyotherside.send('user_table_exporting')
        db_path = sqlite3.connect("%s/utfoods.ivofernandes/Databases/a53f48a3719dc73a6bfce758f513a8d4.sqlite" % os.environ["XDG_DATA_HOME"])
        cursor = db_path.cursor()
        sql_statement = '''SELECT * FROM user'''
        cursor.execute(sql_statement)
        data = cursor.fetchall()
        with open(csv_user_table, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['id',
            'age',
            'sex_at_birth',
            'weight',
            'height',
            'activity',
            'rec_cal',
            'ap_lo',
            'ap_hi'
            ])
            writer.writerows(data)
        cursor.close()
        time.sleep(1)
        pyotherside.send('user_table_exported')
  
    def ingestionsTable():
        csv_ingestions_table = '/home/phablet/Documents/utFoods_exports/utFoods_ingestions_table.csv'
        pyotherside.send('user_ingestions_exporting')
        db_path = sqlite3.connect("%s/utfoods.ivofernandes/Databases/a53f48a3719dc73a6bfce758f513a8d4.sqlite" % os.environ["XDG_DATA_HOME"])
        cursor = db_path.cursor()
        sql_statement = '''SELECT * FROM ingestions'''
        cursor.execute(sql_statement)
        data = cursor.fetchall()
        with open(csv_ingestions_table, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['id',
            'id_user',
            'name',
            'nutriscore',
            'cal',
            'fat',
            'carbo',
            'protein',
            'date',
            'meal'
            ])
            writer.writerows(data)
        cursor.close()
        time.sleep(1)
        pyotherside.send('user_ingestions_exported')

    def waterTable():
        csv_water_tracker_table = '/home/phablet/Documents/utFoods_exports/utFoods_water_tracker_table.csv'
        pyotherside.send('user_water_exporting')
        db_path = sqlite3.connect("%s/utfoods.ivofernandes/Databases/a53f48a3719dc73a6bfce758f513a8d4.sqlite" % os.environ["XDG_DATA_HOME"])
        cursor = db_path.cursor()
        sql_statement = '''SELECT * FROM water_tracker'''
        cursor.execute(sql_statement)
        data = cursor.fetchall()
        with open(csv_water_tracker_table, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['id',
            'id_user',
            'cups',
            'date'])
            writer.writerows(data)
        cursor.close()
        time.sleep(1)
        pyotherside.send('user_water_exported')
    
    def weightTable():
        csv_weight_tracker_table = '/home/phablet/Documents/utFoods_exports/utFoods_weight_tracker_table.csv'
        pyotherside.send('user_weight_exporting')
        db_path = sqlite3.connect("%s/utfoods.ivofernandes/Databases/a53f48a3719dc73a6bfce758f513a8d4.sqlite" % os.environ["XDG_DATA_HOME"])
        cursor = db_path.cursor()
        sql_statement = '''SELECT * FROM weight_tracker'''
        cursor.execute(sql_statement)
        data = cursor.fetchall()
        with open(csv_weight_tracker_table, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['id',
            'id_user',
            'weight',
            'date'])
            writer.writerows(data)
        cursor.close()
        time.sleep(1)
        pyotherside.send('user_weight_exported')
    
    def sportsTable():
        csv_sport_table =  '/home/phablet/Documents/utFoods_exports/utFoods_sport_tracker_table.csv'
        pyotherside.send('user_sport_exporting')
        db_path = sqlite3.connect("%s/utfoods.ivofernandes/Databases/a53f48a3719dc73a6bfce758f513a8d4.sqlite" % os.environ["XDG_DATA_HOME"])
        cursor = db_path.cursor()
        sql_statement = '''SELECT * FROM sports'''
        cursor.execute(sql_statement)
        data = cursor.fetchall()
        with open(csv_sport_table, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['id',
            'id_user',
            'sport',
            'duration',
            'date'])
            writer.writerows(data)
        cursor.close()
        time.sleep(1)
        pyotherside.send('user_sports_exported')
        

export_data = ExportData()