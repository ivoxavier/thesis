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

  function getFoods(){
    //count the number of itens in json for loop iteration
    var number_of_foods = utFoods_community_foods_json.count

    for(var i = 0; i < number_of_foods; i++){
      //append all the itens into utFoods foods list model 
      var _json = utFoods_community_foods_json.model.get(i);
      utFoods_community_foods_model.append({
        "product_name" : _json.product_name,
        "nutriscore_grade" : _json.nutriscore,
        "energy_kcal_100g": _json.calories,
        "fat_100g" : _json.fat,
        "carbohydrates_100g" : _json.carbo,
        "proteins_100g" : _json.protein
      })
    }
}