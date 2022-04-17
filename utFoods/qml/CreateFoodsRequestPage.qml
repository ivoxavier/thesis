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
import Morph.Web 0.1
import QtWebEngine 1.7
import Ubuntu.Components.Popups 1.3
import "components"
import "../js/FoodsRequestFormUrl.js" as FoodsRequestFormUrl
import "../js/UserAgent.js" as UserAgent

Page{
    id: create_request_page
    objectName :"CreateFoodsRequestPage"
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title : i18n.tr("Foods Request")
            }
    
    LoadingWebPage{id:loadIcon;visible: !web_view.loading ? false : true}

    WebEngineView {
        id: web_view
        visible : !web_view.loading ? false : true

        anchors{ 
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }
        
        focus: true                 
        
        property var currentWebview: web_view
        
        settings.pluginsEnabled: true

        profile:  WebEngineProfile {
          id: webContext
          httpUserAgent: UserAgent.user_agent
          storageName: "Storage"
        }

        anchors {
          fill:parent
          centerIn: parent.verticalCenter
        }

        url: FoodsRequestFormUrl.url

        zoomFactor: 1.5
        
        onNewViewRequested: {
            request.action = WebEngineNavigationRequest.IgnoreRequest
            if(request.userInitiated) {
                Qt.openUrlExternally(request.requestedUrl)
          }
      }
    } 
    NavigationBar{id: navigation_shape}     
}