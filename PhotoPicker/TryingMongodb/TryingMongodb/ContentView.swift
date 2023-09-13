//
//  ContentView.swift
//  TryingMongodb
//
//  Created by Mukund vaghasiya  on 13/09/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedPhotoData: Data?
    @State var PhotoPicking:PhotosPickerItem?
    var body: some View {
        VStack {
            PhotosPicker(selection: $PhotoPicking,matching: .images) {
                Text("Image Picker")
            }
            .onChange(of: PhotoPicking) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedPhotoData = data
                        print(selectedPhotoData)
                    }
                }
            }
            
            if let image = selectedPhotoData{
                var temp = UIImage(data: image)
                
                Image(uiImage: temp!)
                    .resizable()
                    .frame(width: 200,height: 200)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
