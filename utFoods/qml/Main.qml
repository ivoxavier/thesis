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
    property string app_version : "0.3.0"
    automaticOrientation: true
    anchorToKeyboard: true
    width: units.gu(45)
    height: units.gu(75)

    //provides locale specific properties
    property var locale: Qt.locale()

    //provides current datetime
    property date currentDate: new Date()

    /*properties for calculating calories target --start--*/

    //setPlanPage
    property int user_goal
    property string type_goal

    //setActivityPage
    property int user_activity_level

    //setUserSexAtBirthPage
    property int user_sex_at_birth //0 for Male. 1 for Female

    //setUserAgePage
    property int user_age

    //setWeightPage
    property double user_weight

    //setHeightPage
    property int user_height

    //recommended calories for user
    property int equation_recommended_calories

    /*properties for calculating calories target --end--*/
    

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

    //SetPlanPage, where users can set their objective
    Component{
        id: set_plan_page
        SetPlanPage{}
    }

    //SetActivityPage, where users can set their activity level
    Component{
        id: set_activity_page
        SetActivityPage{}
    }

    //SetSexAtBirth, where volunteers set their sex at birth
    Component{
        id: set_sex_at_birth_page
        SetSexAtBirthPage{}
    }

    //SetAgePage, where volunteers set their age
    Component{
        id: set_age_page
        SetAgePage{}
    }

    //SetWeightPage, where volunteers set their weight
    Component{
        id: set_weight_page
        SetWeightPage{}
    }

    //SetAgePage, where volunteers set their age
    Component{
        id: set_height_page
        SetHeightPage{}
    }

    //CreatePage, process for creating the db
    Component{
        id: create_storage_page
        CreateStoragePage{}
    }

    //HomePage, its home
    Component{
        id: home_page
        HomePage{}
    }

    //ExportDataPage, where users can export the data produced
    Component{
        id: export_data_page
        ExportDataPage{}
    }

    Component.onCompleted:{
        ControlUserExperienceTime.isValid()
    }
}