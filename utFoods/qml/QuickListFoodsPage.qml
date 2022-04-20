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
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.ListItems 1.3 
import Ubuntu.Components.Popups 1.3
import QtQuick.LocalStorage 2.12
import "components"
import "../js/utFoodsCommunityFoodsList.js"  as UtFoodsCommunityFoodsList


Page{
    id: quick_list_foods_page
    objectName: 'QuickListFoodsPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Quick List Foods")
        }

    //receives meal category from HomePage.slotAddMeal
    property int meal_quick_list_foods_page

    //Foods Lists
    property QtObject open_foods_facts_xml : OpenFoodsFactsList{}
    property QtObject user_created_list : UserFoodsList{}
    property QtObject utFoods_community_list :  ListModel{id: utFoods_community_foods_model;dynamicRoles : true}

    JSONListModel {
        id: utFoods_community_foods_json
        source: app_settings.is_api_utFoods_community_foods_list_enabled ? "https://ivoxavier.github.io/thesis/utFoods_community_foods_list.json" : " "
        query: "$[*]"
        onJsonChanged: UtFoodsCommunityFoodsList.getFoods()
    }


    SortFilterModel{
        id: sorted_model

        model: app_settings.is_xml_openfoodsfacts_enabled ? open_foods_facts_xml : app_settings.is_user_created_foods_list_enabled ? user_created_list : utFoods_community_list
        sort.property: "product_name"
        sort.order: Qt.DescendingOrder
        // case insensitive sorting
        sortCaseSensitivity: Qt.CaseInsensitive
        filter.property: "product_name"
        // .* filters all results
        //filter.pattern: /.*/
    }

    Component{
        id: search_popover
        ListViewFoodsFilterPopOver{}
    }

    
    ListViewFoods{
        id: list_view_foods
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }
        height: parent.height
        width: parent.width
        
    }

    RowAbstractBarcodeButton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: quick_addition_button.top
        visible : app_settings.is_api_openfoodsfacts_enabled ? true : false
    }

    RowAbstractQuickAdditionButton{
        id: quick_addition_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: find_button.top
    }

    RowAbstractFindButton{
        id: find_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
    }
    
  
    NavigationBar{id: navigation_shape}
}