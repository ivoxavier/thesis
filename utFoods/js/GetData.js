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

/* utFoods DataBase Tools */

function connectDB() {
  return LocalStorage.openDatabaseSync("utFoods_db", "0.1", "utFoods_data", 2000000);
}

// assign to homepage property the amount of calories ingested
function getTotalCalConsumed(){
    var total_cal_consumed = 'SELECT SUM(i.cal) AS totalcal \
    FROM ingestions i \
    WHERE i.date == "which_date"'.replace("which_date", root.stringDate);
      var db = connectDB();
      var rsToQML 
      db.transaction(function (tx) {
        var results = tx.executeSql(total_cal_consumed)
        for (var i = 0; i < results.rows.length; i++) {
          rsToQML = results.rows.item(i).totalcal                 
          if(rsToQML == 0 || rsToQML == null){
              home_page.query_total_cal_consumed = 0
          } else{
            home_page.query_total_cal_consumed = rsToQML
          }
    
        }
     })
}

//assign to homepage property the calories left
function getTotalCalRemaining(){
  var total_cal_remaining = 'WITH dif AS (SELECT (user.rec_cal - SUM(i.cal)) AS remaining \
  FROM ingestions i \
  JOIN user ON i.id_user = user.id \
  WHERE i.date == "which_date") \
  SELECT remaining FROM dif'.replace("which_date",root.stringDate);
  var db = connectDB();
  db.transaction(function (tx) {
    var results = tx.executeSql(total_cal_remaining)
    for (var i = 0; i < results.rows.length; i++) {
      var rsToQML = results.rows.item(i).remaining
      if (rsToQML === null || rsToQML === 0 ){
        home_page.query_total_cal_remaining = app_settings.rec_cal
      } else {
        home_page.query_total_cal_remaining =  rsToQML
      }
    }
  }) 
}

//assign to homepage property the amount foods ingested
function getTotalFoodsConsumed(){
  var total_foods_consumed = 'SELECT COUNT(i.id) AS totalFoods \
  FROM ingestions i \
  WHERE i.date == "which_date"'.replace("which_date", root.stringDate);
    var db = connectDB();
    var rsToQML 
    db.transaction(function (tx) {
      var results = tx.executeSql(total_foods_consumed)
      for (var i = 0; i < results.rows.length; i++) {
        rsToQML = results.rows.item(i).totalFoods                
        if(rsToQML == 0 || rsToQML == null){
            home_page.query_total_foods_consumed = 0
        } else{
          home_page.query_total_foods_consumed = rsToQML
        }
      }
   })
}

//assign to homepage property the amount calories ingested in breakfast
function getBreakfastCalories(){
  var total_cal_consumed_breakfast = 'SELECT SUM(i.cal) AS totalcal \
  FROM ingestions i \
  WHERE i.date == "which_date" AND i.meal = 1'.replace("which_date", root.stringDate);
  var db = connectDB();
  var rsToQML        
  db.transaction(function (tx) {
    var results = tx.executeSql(total_cal_consumed_breakfast)
    for (var i = 0; i < results.rows.length; i++) {
      rsToQML = results.rows.item(i).totalcal                             
      if(rsToQML == 0 || rsToQML == null){
        home_page.query_total_cal_breakfast = 0
      } else{
        home_page.query_total_cal_breakfast = rsToQML
      }
    }
  })
  }

  //assign to homepage property the amount calories ingested in lunch
  function getLunchCalories(){
    var total_cal_consumed_lunch = 'SELECT SUM(i.cal) AS totalcal \
    FROM ingestions i \
    WHERE i.date == "which_date" AND i.meal = 2'.replace("which_date", root.stringDate);
    var db = connectDB();
    var rsToQML          
    db.transaction(function (tx) {
      var results = tx.executeSql(total_cal_consumed_lunch)
      for (var i = 0; i < results.rows.length; i++) {
        rsToQML = results.rows.item(i).totalcal                              
        if(rsToQML == 0 || rsToQML == null){
          home_page.query_total_cal_lunch = 0
        } else{
          home_page.query_total_cal_lunch = rsToQML
        }
      }
    })
  }

  //assign to homepage property the amount calories ingested in dinner
  function getDinnerCalories(){
    var total_cal_consumed_dinner = 'SELECT SUM(i.cal) AS totalcal \
    FROM ingestions i \
    WHERE i.date == "which_date" AND i.meal = 3'.replace("which_date", root.stringDate);
    var db = connectDB();
    var rsToQML
    db.transaction(function (tx) {
      var results = tx.executeSql(total_cal_consumed_dinner)
      for (var i = 0; i < results.rows.length; i++) {
        rsToQML = results.rows.item(i).totalcal
        if(rsToQML == 0 ||  rsToQML == null){
          home_page.query_total_cal_dinner = 0
        } else{
          home_page.query_total_cal_dinner = rsToQML
        }
      }
  })
  }

  function getSnacksCalories(){
    var total_cal_consumed_snacks = 'SELECT SUM(i.cal) AS totalcal \
    FROM ingestions i \
    WHERE i.date == "which_date" AND i.meal = 4'.replace("which_date", root.stringDate);
    var db = connectDB();
    var rsToQML
    db.transaction(function (tx) {
      var results = tx.executeSql(total_cal_consumed_snacks)
      for (var i = 0; i < results.rows.length; i++) {
        rsToQML = results.rows.item(i).totalcal
        if(rsToQML == 0 || rsToQML == null){
          home_page.query_total_cal_snacks = 0
        } else{
          home_page.query_total_cal_snacks = rsToQML
        }
      }
  })
  }

  function getCups(){
    var water_cups = 'SELECT COUNT(cups) AS cups \
    FROM water_tracker \
    WHERE date == "which_date"'.replace("which_date", root.stringDate);
    var db = connectDB();
    var rsToQML
    db.transaction(function (tx) {
      var results = tx.executeSql(water_cups)
      for (var i = 0; i < results.rows.length; i++) {
        rsToQML = results.rows.item(i).cups
        if(rsToQML == 0 || rsToQML == null ){
          home_page.query_total_water_cups = 0
        } else{
          home_page.query_total_water_cups = rsToQML
        }
        
      }
})
}

function getSportsDone(){
  var total_sports_remaining = 'SELECT SUM(duration) as done\
  FROM sports s \
  JOIN user ON s.id_user = user.id \
  WHERE s.date == "which_date"'.replace("which_date",root.stringDate);
  var db = connectDB();
  db.transaction(function (tx) {
    var results = tx.executeSql(total_sports_remaining)
    for (var i = 0; i < results.rows.length; i++) {
      var rsToQML = results.rows.item(i).done
      if (rsToQML === null || rsToQML == 0){
        home_page.query_total_activity_made = 0
      } else {
      home_page.query_total_activity_made = rsToQML
      }
    }
  }) 
}