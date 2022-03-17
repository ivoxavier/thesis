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

function validate(){
   //counts how many ID's are set 
   var registered_people_json = login_json.count

   //creates empty array for storing ID's
   var store_ids = []
   
   //push ID's to array 
   for(var i = 0; i < registered_people_json; i++){
      store_ids.push(i)
   }
   
   //stores property user_id from login_page
   var input_login_id = login_page.user_id

   //check if stored id's has the one inputed by user
   if(store_ids.includes(input_login_id)){

      //search for the respective ID part in Json
      var _json = login_json.model.get(input_login_id)

      //compare passcode stored in json is equal to provided by user. If so, push the next stack and pop's the loginStack
      if(login_page.user_passcode == _json.passcode){
          PopupUtils.close(auth_dialog)
          page_stack.pop()
          //TODO: add here next stack 
      } 
      else{
         //if passcode is not equal validate dialog is closed and popUp appears on the screen
         PopupUtils.close(auth_dialog)
         PopupUtils.open(wrong_credentials)
      }
   } 
   else {
      //if ID provided is not included in json
      auth_indicator.running = false
      PopupUtils.close(auth_dialog)
      PopupUtils.open(wrong_credentials)
   }
}