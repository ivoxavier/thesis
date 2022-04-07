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

import QtQuick 2.9
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0

Settings {
    //stores the login for in db
    property int id_login

    //stores the app configuration
    property bool is_clean_install : true
    property bool is_page_headers_enabled : false
    property bool is_xml_openfoodsfacts_enabled: true
    property bool is_api_themealdb_enabled: false
    property bool is_weight_tracker_chart_enabled: false
    
    //stores 
    property double water_weight_calc
    
    //stores the user starts using date
    property string using_app_date

    //stores plan type
    property string plan_type
    
    //stores recommended calories
    property int rec_cal

    //path for imported pic
    property var account_picture_path : "../assets/logo.svg"
}