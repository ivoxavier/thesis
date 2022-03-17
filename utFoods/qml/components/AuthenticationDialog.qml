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
import "../../js/ControlLogIn.js" as LogIn
import "../../js/LogInJsonURL.js" as Json


Dialog {
    id: auth_dialog
    title: i18n.tr("Verifying credentials")

    JSONListModel {
        id: login_json
        source: Json.url()
        query: "$[*]"
        onJsonChanged: {
            LogIn.validate()
        }
    }  
    ActivityIndicator{id: auth_indicator;running: true}        
}