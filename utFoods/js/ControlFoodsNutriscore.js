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

function backgroundColor(grade){
   return  grade === 'a' ?
   "green" : grade === 'b' ?
   "#09b227" : grade === 'c' ?
   "#cba000" : grade === 'd' ?
   "#e57a01" : grade === 'e' ?
   UbuntuColors.red : "black"
}

function roundToOneDecimal(value){
   return Number(value.toFixed(1))
}


function negativePointsEnergy(cal){
   //points assigned for nutrients that have a negative impact on the nutritional score (N) of cal
   if(cal <= 335){
      // zero
     } else if(cal > 335 && cal <= 670){
      quick_addition_page.subtotal_negative_points++
     } else if(cal > 670 && cal <= 1005){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 2
     } else if(cal > 1005 && cal <= 1340){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 3
     } else if(cal > 1340 && cal <= 1675){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 4
     } else if(cal > 1675 && cal <= 2010){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 5
     } else if(cal > 2010 && cal <= 2345){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 6
     } else if(cal > 2345 && cal <= 2680){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 7
     } else if(cal > 2680 && cal <= 3015){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 8
     } else if(cal > 3015 && cal <= 3350){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 9
     } else {
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 10
     }
}

function negativePointsSugars(sugars){
   //points assigned for nutrients that have a negative impact on the nutritional score (N) of sugars
   if(sugars <= 4.5){
      // zero
     } else if(sugars > 4.5 && sugars <= 9){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points++
     } else if(sugars > 9 && sugars <= 13.5){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 2
     } else if(sugars > 13.5 && sugars <= 18){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 3
     } else if(sugars > 18 && sugars <= 22.5){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 4
     } else if(sugars > 22.5 && sugars <= 27){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 5
     } else if(sugars > 27 && sugars <= 31){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 6
     } else if(sugars > 31 && sugars <= 36){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 7
     } else if(sugars > 36 && sugars <= 40){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 8
     } else if(sugars > 40 && sugars <= 44.5){
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 9
     } else {
      quick_addition_page.subtotal_negative_points =  quick_addition_page.subtotal_negative_points + 10
     }
}

function negativePointsSaturatedFat(saturated_fat){
    //points assigned for nutrients that have a negative impact on the nutritional score (N) of saturated_fat
    if(saturated_fat <= 1){
      // zero
     } else if(saturated_fat > 1 && saturated_fat <= 2){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points++
     } else if(saturated_fat > 2 && saturated_fat <= 3 ){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 2
     } else if(saturated_fat > 3 && saturated_fat <= 4){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 3
     } else if(saturated_fat > 4 && saturated_fat <= 5){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 4
     } else if(saturated_fat > 5 && saturated_fat <= 6){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 5
     } else if(saturated_fat > 6 && saturated_fat <= 7){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 6
     } else if(saturated_fat > 7 && saturated_fat <= 8){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 7
     } else if(saturated_fat > 8 && saturated_fat <= 9){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 8
     } else if(saturated_fat > 9 && saturated_fat <= 10){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 9
     } else {
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 10
     }
}

function negativePointsSodium(salt){
   // according with: https://www.santepubliquefrance.fr/content/download/150263/file/2021_07_21_QR_scientifique_et_technique_V41_EN.pdf
   // sodium must be calculated from salt in miligrams
   var sodium = salt * 1000

   //points assigned for nutrients that have a negative impact on the nutritional score (N) of sodium
   if(sodium <= 90){
      // zero
     } else if(sodium > 90 && sodium <= 180){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points++
     } else if(sodium > 180 && sodium <= 270){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 2
     } else if(sodium > 270 && sodium <= 360){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 3
     } else if(sodium > 360 && sodium <= 450){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 4
     } else if(sodium > 450 && sodium <= 540){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 5
     } else if(sodium > 540 && sodium <= 630){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 6
     } else if(sodium > 630 && sodium <= 720){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 7
     } else if(sodium > 720 && sodium <= 810){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 8
     } else if(sodium > 810 && sodium <= 900){
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 9
     } else {
      quick_addition_page.subtotal_negative_points = quick_addition_page.subtotal_negative_points + 10
     }
}


function positivePointsFruitsVegetables(is){
   if(is){
      quick_addition_page.subtotal_positive_points =  quick_addition_page.subtotal_positive_points++
   } else{
      //zero
   }
}

function positivePointsFiber(fiber){
   if(fiber <= 0.9){
      //zero
   } else if(fiber > 0.9 && fiber <= 1.9){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points++
   } else if(fiber > 1.9 && fiber <= 2.8){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 2
   } else if(fiber > 2.8 && fiber <= 3.7){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 3
   } else if(fiber > 3.7 && fiber <= 4.6){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 4
   } else{
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 5
   }
}

function positivePointsProtein(protein){
   if(protein <= 1.6){
      //zero
   } else if(protein > 1.6 && protein <= 3.2){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points++
   } else if(protein > 3.2 && protein <= 4.8){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 2
   } else if(protein > 4.8 && protein <= 6.4){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 3
   } else if(protein > 6.4 && protein <= 8.0){
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 4
   } else{
      quick_addition_page.subtotal_positive_points = quick_addition_page.subtotal_positive_points + 5
   }
}

function getGrade(final_score){
   if(final_score < -1){
      quick_addition_page.nutriscore_quick_addition_page = "a"
      quick_addition_page.nutriscore_label = "a"
   } else if(final_score >= 0 && final_score <= 3){
      quick_addition_page.nutriscore_quick_addition_page = "b"
      quick_addition_page.nutriscore_label = "b"
   } else if(final_score >= 3 && final_score <= 13){
      quick_addition_page.nutriscore_quick_addition_page = "c"
      quick_addition_page.nutriscore_label = "c"
   } else if(final_score >= 13 && final_score <= 23){
      quick_addition_page.nutriscore_quick_addition_page = "d"
      quick_addition_page.nutriscore_label = "d"
   } else {
      quick_addition_page.nutriscore_quick_addition_page = "e"
      quick_addition_page.nutriscore_label = "e"
   }
}