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
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.ListItems 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.0
import QtQuick.XmlListModel 2.7



XmlListModel {
        id: xmlScheme

        source: Qt.locale().name === "pt_PT" ? 
        "../../xml/foods_pt.xml" : Qt.locale().name === "fr_FR" ?
        "../../xml/foods_fr.xml" : Qt.locale().name === "es_ES" ?
        "../../xml/foods_es.xml" : "../../xml/foods_uk.xml"
        query: "/data/row"

        XmlRole { name: "product_name"; query: "product_name/string()"}
        XmlRole { name: "nutriscore_grade"; query: "nutriscore_grade/string()" }
        XmlRole { name: "energy_kcal_100g"; query: "energy_kcal_100g/string()" }
        XmlRole { name: "fat_100g"; query: "fat_100g/string()" }
        XmlRole { name: "carbohydrates_100g"; query: "carbohydrates_100g/string()" }
        XmlRole { name: "proteins_100g"; query: "proteins_100g/string()" }       
}