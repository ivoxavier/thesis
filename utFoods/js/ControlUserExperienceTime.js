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

function isValid(){
  //set the date where the experiment must end
  var end_date = new Date("2022-06-12")

  //test if current date is superior than endate
  if(root.currentDate > end_date){
    //push export stack
    page_stack.push(export_data_page)
  } else{
    
    //still in experiment time
    if(app_settings.is_clean_install){

      //new install || not configured
      page_stack.push(login_page)
    }
    else{

      //during experiment time and app configured
      page_stack.push(home_page)
    }
  }
}