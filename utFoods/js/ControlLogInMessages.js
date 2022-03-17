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

function state(){
   /*Trigger messages for empty fields*/
   if(login_page.user_id == -1 && login_page.user_passcode.length <= 1){
      //all blank spaces
      PopupUtils.open(all_fields_empty_dialog)
      
  } else if (login_page.user_id == -1 && login_page.user_passcode.length > 1){
      //id blank
      PopupUtils.open(id_field_empty_dialog)
      login_page.user_id = -1
      
  } else if (login_page.user_id !== -1 && login_page.user_passcode.length <= 1){
     //passcode blank
     PopupUtils.open(passcode_field_empty_dialog)
    
  } else if(login_page.user_id == -1 && login_page.user_passcode.length !== 1) {
     PopupUtils.open(id_field_empty_dialog)
  }
  
   else{
      //ready for validating
      PopupUtils.open(auth_dialog)
  }
}