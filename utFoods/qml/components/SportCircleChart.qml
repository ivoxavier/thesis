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
import QtQuick.Controls.Suru 2.2
import "../../js/ThemeColors.js" as ThemeColors
  
Canvas {
    id: canvas
        
    width: units.gu(10)
    height: units.gu(8)
    antialiasing: true
    

    property color primaryColor: "#aea79f"
    property color secondaryColor: Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_circle_chart : ThemeColors.utFoods_dark_theme_circle_chart 

    property real centerWidth: width / 2
    property real centerHeight: height / 2
    
    property real radius: units.gu(2.7)

    property real minimumValue: 0
    property real maximumValue: 100
    property real currentValue: (home_page.query_total_activity_made / app_settings.target_time) * 100

    // this is the angle that splits the circle in two arcs
    // first arc is drawn from 0 radians to angle radians
    // second arc is angle radians to 2*PI radians
    property real angle: (currentValue - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI

    // we want both circle to start / end at 12 o'clock
    // without this offset we would start / end at 9 o'clock
    property real angleOffset: -Math.PI / 2


    onPrimaryColorChanged: requestPaint()
    onSecondaryColorChanged: requestPaint()
    onMinimumValueChanged: requestPaint()
    onMaximumValueChanged: requestPaint()
    onCurrentValueChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.save();

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // First, thinner arc
        // From angle to 2*PI

        ctx.beginPath();
        ctx.lineWidth = units.gu(0.5);
        ctx.strokeStyle = primaryColor;
        ctx.arc(canvas.centerWidth,
        canvas.centerHeight,
        canvas.radius,
        angleOffset + canvas.angle,
        angleOffset + 2*Math.PI);
        ctx.stroke();

        // Second, thicker arc
        // From 0 to angle

        ctx.beginPath();
        ctx.lineWidth = units.gu(0.6);
        ctx.strokeStyle = canvas.secondaryColor;
        ctx.arc(canvas.centerWidth,
        canvas.centerHeight,
        canvas.radius,
        canvas.angleOffset,
        canvas.angleOffset + canvas.angle);
        ctx.stroke();
        ctx.restore();
    }

    Column{
        anchors.centerIn: parent
        width: parent.width / 2
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: home_page.query_total_activity_made
            font.pointSize: units.gu(1.3)
            color:Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
        }
        
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("min") 
            font.pointSize: units.gu(1)
            color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
        }
    }
} 