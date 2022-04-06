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

function getRecipe(){
  var _json = theMealDB.model.get(0);
  if (typeof _json !== "undefined" && typeof _json.idMeal !== "undefined" && _json.strMeal !== "") {
      root.recipe_name = _json.strMeal;
      root.recipe_img_url = _json.strMealThumb;
      root.recipe_youtbe_url = _json.strYoutube;
      root.recipe_instructions = _json.strInstructions
      root.recipe_ingredient1 = _json.strIngredient1
      root.recipe_ingredient2 = _json.strIngredient2
      root.recipe_ingredient3 = _json.strIngredient3
      root.recipe_ingredient4 = _json.strIngredient4
      root.recipe_ingredient5 = _json.strIngredient5
      root.recipe_ingredient6 = _json.strIngredient6
      root.recipe_ingredient7 = _json.strIngredient7
      root.recipe_ingredient8 = _json.strIngredient8
      root.recipe_ingredient9 = _json.strIngredient9
      root.recipe_ingredient10 = _json.strIngredient10
      root.recipe_measure1 = _json.strMeasure1
      root.recipe_measure2 = _json.strMeasure2
      root.recipe_measure3 = _json.strMeasure3
      root.recipe_measure4 = _json.strMeasure4
      root.recipe_measure5 = _json.strMeasure5
      root.recipe_measure6 = _json.strMeasure6
      root.recipe_measure7 = _json.strMeasure7
      root.recipe_measure8 = _json.strMeasure8
      root.recipe_measure9 = _json.strMeasure9
      root.recipe_measure10 = _json.strMeasure10
  }
}