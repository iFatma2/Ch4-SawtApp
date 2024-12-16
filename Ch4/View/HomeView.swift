//
//  HomeView.swift
//  Ch4-Sawt
//
//  Created by Fatimah Alqarni on 15/06/1446 AH.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            if viewModel.showResultView {
                TextResultView(text: viewModel.recognizedText)
            } else {
                Spacer()

                ZStack {
                    if viewModel.showMenu {
                        CustomMenu(
                            showPhotoPicker: { viewModel.showPhotoPicker = true },
                            showCamera: { viewModel.showCamera = true }
                        )
                        .offset(y: -100)
                    }

                    Button(action: {
                        withAnimation {
                            viewModel.showMenu.toggle()
                        }
                    }) {
                        Image("AddPic")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                }

                Text("Click the button to get started")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color("TextColor"))
                    .padding(.top, 20.0)

                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.showPhotoPicker, onDismiss: viewModel.extractTextFromImage) {
            PhotoPicker(selectedImage: $viewModel.selectedImage)
        }
        .sheet(isPresented: $viewModel.showCamera, onDismiss: viewModel.extractTextFromImage) {
            CameraView(selectedImage: $viewModel.selectedImage)
        }
    }
}
