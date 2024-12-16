//
//  CustomMenu.swift
//  Ch4-Sawt
//
//  Created by Fatimah Alqarni on 15/06/1446 AH.
//

import SwiftUI

struct CustomMenu: View {
    let showPhotoPicker: () -> Void
    let showCamera: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            
            // For Uploding Photo from Library
            Button(action: showPhotoPicker) {
                HStack {
                    Text("Photo Library")
                    Spacer()
                    Image(systemName: "photo")
                }
                .padding()
            }
            .background(Color("PopOverColor"))
            .foregroundColor(Color("TextColor"))

            Divider()

            // For Scanning an image from Camera
            Button(action: showCamera) {
                HStack {
                    Text("Take a Photo")
                    Spacer()
                    Image(systemName: "camera")
                }
                .padding()
            }
            .background(Color("PopOverColor"))
            .foregroundColor(Color("TextColor"))
            
            Divider()
            
            // For Scanning an image from Camera
            Button(action: showCamera) {
                HStack {
                    Text("Choose File")
                    Spacer()
                    Image(systemName: "doc")
                }
                .padding()
            }
            .background(Color("PopOverColor"))
            .foregroundColor(Color("TextColor"))
        }
        .background(Color.black)
        .cornerRadius(10)
        .padding([.leading, .bottom], 120.0)
        .frame(width: 380, height: 200.0)
        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
