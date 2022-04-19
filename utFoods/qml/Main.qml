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
    property string app_version : "0.9.0"
    automaticOrientation: true
    anchorToKeyboard: true
    width: units.gu(45)
    height: units.gu(75)

    //provides locale specific properties
    property var locale: Qt.locale()

    //provides current datetime
    property date currentDate: new Date()

    //provides date in string format masked for sqlite db
    property var stringDate: currentDate.toLocaleDateString(locale, 'yyyy-MM-dd')
    
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
    
    //Recipes properties
    property var recipe_name //strMeal
    property var recipe_img_url // strMealThumb
    property var recipe_instructions //strInstructions
    property var recipe_youtbe_url

    property var recipe_ingredient1 : " " //strIngredient1
    property var recipe_ingredient2 : " "//strIngredient2
    property var recipe_ingredient3 : " "//strIngredient3
    property var recipe_ingredient4 : " "//strIngredient4
    property var recipe_ingredient5 : " "//strIngredient5
    property var recipe_ingredient6 : " "//strIngredient6
    property var recipe_ingredient7 : " "//strIngredient7
    property var recipe_ingredient8 : " "//strIngredient8
    property var recipe_ingredient9 : " "//strIngredient9
    property var recipe_ingredient10 : " "//strIngredient10

    property var recipe_measure1 : " "//strMeasure1
    property var recipe_measure2 : " "//strMeasure2
    property var recipe_measure3 : " "//strMeasure3
    property var recipe_measure4 : " "//strMeasure4
    property var recipe_measure5 : " "//strMeasure5
    property var recipe_measure6 : " "//strMeasure6
    property var recipe_measure7 : " "//strMeasure7
    property var recipe_measure8 : " "//strMeasure8
    property var recipe_measure9 : " "//strMeasure9
    property var recipe_measure10: " " //strMeasure10


    /* custom signals --start--*/
    signal initDB()
    /* custom signals --end--*/


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

    //QuickListFoodsPage gives users a list of foods
    Component{
        id: quick_list_foods_page
        QuickListFoodsPage{}
    }

    //QuickListFoodsPage gives users a list of foods
    Component{
        id: quick_addition_page
        QuickAdditionPage{}
    }

    //CreateFoodsRequestPage, opens a webview form to allow users resquesting a food || meal to be shared with the community
    Component{
        id: create_request_page
        CreateFoodsRequestPage{}
    }

    //SetFoodPage, let uses set the ingestions
    Component{
        id: set_food_page
        SetFoodPage{}
    }

    //SportsTypePage, let uses select the sports type
    Component{
        id: sports_page
        SportsTypePage{}
    }

    //RunningPage, let uses from a list of running activities
    Component{
        id: running_page
        RunningPage{}
    }

    //WalkingPage, let uses from a list of running activities
    Component{
        id: walking_page
        WalkingPage{}
    }

    //CyclingPage, let uses from a list of running activities
    Component{
        id: cycling_page
        CyclingPage{}
    }

    //GymPage, let uses from a list of running activities
    Component{
        id: gym_page
        GymPage{}
    }

    //GymPage, let uses from a list of running activities
    Component{
        id: group_sports_page
        GroupSportsPage{}
    }

    //SwimmingPage, let uses from a list of running activities
    Component{
        id: swimming_page
        SwimmingPage{}
    }

    //SwimmingPage, let uses from a list of running activities
    Component{
        id: recipe_page
        RecipePage{}
    }

    //MenuPage, menu 
    Component{
        id: menu_page
        MenuPage{}
    }

    //ImportPage, let users import a profile pic 
    Component{
        id: import_page
        ImportPage{}
    }

    //UpdateUserValuesPage, let users import a profile pic 
    Component{
        id: update_user_values_page
        UpdateUserValuesPage{}
    }

    //AppLayoutPage, let users define appearance settings
    Component{
        id: app_layout_page
        AppLayoutPage{}
    }

    //OnlineSourcesPage, let enable online sources
    Component{
        id: online_sources_page
        OnlineSourcesPage{}
    }

    //ManageDataPage, let enable online sources
    Component{
        id: manage_data_page
        ManageDataPage{}
    }


    //ManageUserFoodsListPage, let enable online sources
    Component{
        id: manager_user_foods_list_page
        ManageUserFoodsListPage{}
    }

    //DeleteTodayIngestionPage, let user delete each ingestion of dat by swipping from a list
    Component{
        id: delete_today_ingestion_page
        DeleteTodayIngestionPage{}
    }

    Component{
        id:trackers_settings_page
        TrackersSettingsPage{}
    }

    //ExportDataPage, where users can export the data produced
    Component{
        id: export_data_page
        ExportDataPage{}
    }

    //DataAnalysisPage, where users can check theirs consunption habits
    Component{
        id: data_analysis_page
        DataAnalysisPage{}
    }

    //AverageCaloriesPage, average calories page
    Component{
        id: average_calories_page
        AverageCaloriesPage{}
    }

    //ListFoodsIngestedMonthPage, list with the respective foods ingested by month
    Component{
        id: list_foods_ingested_month_page
        ListFoodsIngestedMonthPage{}
    }

    //GraphsPage, page containig data visualization
    Component{
        id: graphs_page
        GraphsPage{}
    }

    //BodyMeasuresPage, page containig body measurements
    Component{
        id: body_measures_page
        BodyMeasuresPage{}
    }

    //NotesPage, page for view registed notes
    Component{
        id: notes_page
        NotesPage{}
    }

    //CreditsPage, page with app info
    Component{
        id: credits_page
        CreditsPage{}
    }

    //ThirdPartySoftwarePage, page with used software from third parties
    Component{
        id: third_party_software_page
        ThirdPartySoftwarePage{}
    }

    Component.onCompleted:{
        ControlUserExperienceTime.isValid()
    }
}