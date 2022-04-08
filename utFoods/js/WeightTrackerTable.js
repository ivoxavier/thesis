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

  var new_weight_tracking = 'INSERT INTO weight_tracker (\
    id_user, weight, date)\
    VALUES (?,?,?)';
  
  function newWeight(weight){          
    var db = connectDB();
    
    db.transaction(function(tx) {
      var results = tx.executeSql(new_weight_tracking, [app_settings.id_login,
      weight,
      root.stringDate]);
      if (results.rowsAffected > 0) {
        console.log("Data Stored")
      } else {
        console.log("error");
      }
    }
  )
}