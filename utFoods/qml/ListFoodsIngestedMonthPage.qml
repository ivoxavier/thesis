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
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import "components"
import "../js/GetData.js" as GetData
import "../js/ThemeColors.js" as ThemeColors



Page{
    id: list_foods_ingested_month_page
    objectName: 'ListFoodsIngestedMonthPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title : requested_month === '01' ?
                i18n.tr("January") : requested_month === '02' ?
                i18n.tr("February") : requested_month === '03' ?
                i18n.tr("March") : requested_month === '04' ?
                i18n.tr("April") : requested_month === '05' ?
                i18n.tr("May") : requested_month === '06' ?
                i18n.tr("June") : requested_month === '07' ?
                i18n.tr("July") : requested_month === '08' ?
                i18n.tr("August") : requested_month === '09' ?
                i18n.tr("September") : requested_month === '10' ?
                i18n.tr("October") : requested_month === '11' ?
                i18n.tr("November") : i18n.tr("December")

                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
            }

        }

    property string requested_month

    Rectangle{
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left : parent.left
            right : parent.right
            bottom : parent.bottom
        }
        color : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }

    ListModel{
        id: all_month_ingestions
        Component.onCompleted: GetData.getAllFoodsMonth(requested_month)
    }

    ListView{
        id: all_month_ingestions_list
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
            left: parent.left
            right: parent.right
        }
        model: all_month_ingestions
        clip: true
        delegate: ListItem{
            ListItemLayout{
                title.text : name
                title.font.bold : true
                subtitle.text: i18n.tr("%1 calories").arg(cal)
                }
        }
    }
    NavigationBar{id:navigation_shape}   
}