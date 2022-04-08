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

  var new_sport_statement = 'INSERT INTO sports (\
    id_user, sport, duration, date)\
    VALUES (?,?,?,?)';
  
  function newSport(name,duration){          
    var db = connectDB();
    
    db.transaction(function(tx) {
      var results = tx.executeSql(new_sport_statement, [app_settings.id_login,
      name,
      duration,
      root.stringDate]);
      if (results.rowsAffected > 0) {
        console.log("Sports : OK")
      } else {
        console.log("Sports : Failed");
      }
    }
  )
}

var remove_all_sports_tracker = 'DELETE FROM sports'

  function deleteAllSports(){
   var db = connectDB();
   var rs;
   db.transaction(function(tx) {
     rs = tx.executeSql(remove_all_sports_tracker);
    }
  );
  return console.log("weight_tracker removed from option remove_all_sports")
 }