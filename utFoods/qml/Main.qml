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
import "../js/ControlUserExperienceTime.js" as ControlUserExperienceTime

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'utfoods.ivofernandes'
    property string app_version : "0.2.0"
    automaticOrientation: true
    anchorToKeyboard: true
    width: units.gu(45)
    height: units.gu(75)

    //provides locale specific properties
    property var locale: Qt.locale()

    //provides current datetime
    property date currentDate: new Date()
    

    //creates a config file under /home/phablet/.config/utfoods.ivofernandes
    AppSettings{id: app_settings}

    //handles the push and pop of stacks in MainView. Plus, logs the currentPage
    PageStack{
        id: page_stack
        onCurrentPageChanged: {
            console.log("Current Stack: " + currentPage.objectName)
        }   
    }

    //LogInPage, where users enter their id and credential
    Component{
        id: login_page
        LogInPage{}
    }

    //LogInPage, where users enter their id and credential
    Component{
        id: export_data_page
        ExportDataPage{}
    }

    Component.onCompleted:{
        ControlUserExperienceTime.isValid()
    }
}