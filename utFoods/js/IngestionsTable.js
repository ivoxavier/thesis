/*
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
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


function connectDB() {
  return LocalStorage.openDatabaseSync("utFoods_db", "0.1", "utFoods_data", 2000000);
}

  var insert_foods_statement = 'INSERT INTO ingestions (\
    id_user,\
    name,\
    nutriscore,\
    cal,\
    fat,\
    carbo,\
    protein,\
    meal,\
    date)\
    VALUES (?,?,?,?,?,?,?,?,?)';
  
  function saveIngestion(name,
    nutriscore,
    cal,
    fat,
    carbo,
    protein,
    meal){          
    var db = connectDB();
    console.log("DataBase.saveNewIngestion : connected to SQL_CONTAINER");
    var validationMessage = "";
    console.log(root.stringDate)
  
    
    db.transaction(function(tx) {
        var rs = tx.executeSql(insert_foods_statement, [app_settings.id_login,
          name,
          nutriscore,
          cal,
          fat,
          carbo,
          protein,
          meal,
          root.stringDate]);
        if (rs.rowsAffected > 0) {
          validationMessage = "DataBase.saveNewIngestion : OK";
        } else {
          validationMessage = "DataBase.saveNewIngestion : Failed ";
        }
    }
    );
    console.log(validationMessage)
    return validationMessage;
  }