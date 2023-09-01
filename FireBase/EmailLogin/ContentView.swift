//
//  ContentView.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var Path:NavigationPath
    var body: some View {
        VStack {
            Text("Ok")
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            Button("SinOut") {
                AuthLogic.shared.SinOut()
                Path.removeLast(Path.count)
            }
        }
        .navigationTitle("HomeScreen")
    }
}


