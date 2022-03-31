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

    //stores the app configuration, necessary to not run config everytime
    property bool is_clean_install : true

    //stores the user starts using date
    property string using_app_date

    //stores plan type
    property string plan_type
    
    //stores recommended calories
    property int rec_cal
}