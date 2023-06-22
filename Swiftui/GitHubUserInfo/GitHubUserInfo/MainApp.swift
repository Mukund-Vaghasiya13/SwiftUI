//
//  MainApp.swift
//  GitHubUserInfo
//
//  Created by Mukund vaghasiya  on 21/06/23.
//

import SwiftUI

struct MainApp: View {
    @Environment(\.verticalSizeClass) var verticalViewPort
    @Environment(\.horizontalSizeClass) var HorizontalViewPort
    var body: some View {
        if(verticalViewPort == .compact)
        {
            LandScapeview()
        }
        else
        {
            ContentView()
        }
    }
}

struct MainApp_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
    }
}
