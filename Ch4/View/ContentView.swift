//
//  ContentView.swift
//  Ch4
//
//  Created by Fatimah Alqarni on 10/06/1446 AH.

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "book.closed.fill")
                    Text("Recent")
                }

            FoldersView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Folders")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .onAppear {
            setTabBarAppearance()
        }
    }

    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "NavBarColor")

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "CustomOrange")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "CustomOrange")!]

        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "CustomGray")
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "CustomGray")]

        UITabBar.appearance().standardAppearance = appearance
    }
}

#Preview {
    ContentView()
}



//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                    Image(systemName: "book.closed.fill")
//                    Text("Home")
//                }
//
//            FoldersView()
//                .tabItem {
//                    Image(systemName: "folder.fill")
//                    Text("Folders")
//                }
//
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//        }
//        .onAppear {
//            setTabBarAppearance()
//        }
//    }
//
//    private func setTabBarAppearance() {
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(named: "NavBarColor") // Set Tab Bar background color
//
//        // Customize the selected icon and text color
//        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "CustomOrange")
//        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "CustomOrange")!]
//
//        // Customize the unselected icon and text color
//        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "CustomGray")
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "CustomGray")]
//
//        UITabBar.appearance().standardAppearance = appearance
//    }
//}
//
//struct HomeView: View {
//    @State private var showMenu = false // State to toggle the popover
//    @State private var isLoading = false // State to show the loading screen
//    @State private var showResultView = false // State to show the new view after loading
//
//    var body: some View {
//        VStack {
//            if showResultView {
//                // Replace the main content with the result view after loading
//                ResultView()
//            } else {
//                Spacer()
//
//                // Plus button & Custom menu
//                ZStack {
//                    if showMenu {
//                        CustomMenu(showLoading: {
//                            showLoadingScreen()
//                        })
//                        .offset(y: -100) // Position the menu above the button
//                    }
//
//                    Button(action: {
//                        withAnimation {
//                            showMenu.toggle()
//                        }
//                    }) {
//                        Image("AddPic")
//                            .resizable()
//                            .frame(width: 150, height: 150)
//
//                    }
//                }
//
//                Text("Click the button to get started")
//                    .font(.title2)
//                    .fontWeight(.regular)
//                    .foregroundColor(Color("TextColor"))
//                    .foregroundColor(.white)
//                //foregroundColor(Color(""))
//                    .padding(.top, 20.0)
//
//                Spacer()
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .foregroundColor(.white)
//        .overlay(
//            // Show loading screen if isLoading is true
//            Group {
//                if isLoading {
//                    LoadingView()
//                }
//            }
//        )
//    }
//
//    // Function to show loading screen for 3 seconds and then transition to ResultView
//    private func showLoadingScreen() {
//        isLoading = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            isLoading = false
//            showMenu = false
//            showResultView = true // Show the new result view
//        }
//    }
//}
//
//struct ResultView: View {
//    var body: some View {
//        VStack {
//            Spacer()
//
//            Button(action: {
//                print("Listen to original tapped")
//            }) {
//                Text("Listen to original")
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color("CustomOrange"))
//                    .cornerRadius(8)
//            }
//            .padding(.horizontal, 40.0)
//            .padding(.bottom, 10.0)
//
//            Button(action: {
//                print("Translate tapped")
//            }) {
//                Text("Translate")
//                    .foregroundColor(Color("CustomOrange"))
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.orange, lineWidth: 2)
//                    )
//            }
//            .padding(.horizontal, 40.0)
//
//            Spacer()
//        }
//        .foregroundColor(.white)
//    }
//}
//
//struct CustomMenu: View {
//    let showLoading: () -> Void
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Button(action: {
//                showLoading()
//            }) {
//                HStack {
//                    Text("Photo Library")
//                    Spacer()
//                    Image(systemName: "photo")
//                }
//                .padding()
//            }
//            
//            .background(Color("PopOverColor"))
//            .foregroundColor(Color("TextColor"))
//
//            Divider()
//
//            Button(action: {
//                showLoading()
//            }) {
//                HStack {
//                    Text("Take a Photo")
//                    Spacer()
//                    Image(systemName: "camera")
//                }
//                .padding()
//            }
//            .background(Color("PopOverColor"))
//            .foregroundColor(Color("TextColor"))
//
//            Divider()
//
//            Button(action: {
//                showLoading()
//            }) {
//                HStack {
//                    Text("Choose File")
//                    Spacer()
//                    Image(systemName: "doc")
//                }
//                .padding()
//            }
//            .background(Color("PopOverColor"))
//            .foregroundColor(Color("TextColor"))
//                    }
//        .background(Color.black)
//        .cornerRadius(10)
//        .padding([.leading, .bottom], 120.0)
//        .frame(width: 380, height: 380.0)
//        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
//    }
//}
//
//struct LoadingView: View {
//    var body: some View {
//        ZStack {
//            Color("LoadingBGColor") // Set White/Black background based on the OS
//                .edgesIgnoringSafeArea(.all) // Ensures the background covers the entire screen
//            VStack {
//                Text("Loading")
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("CustomOrange"))
//                    .font(.title)
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
//                    .scaleEffect(1.5)
//            }
//        }
//    }
//}
//
//struct FoldersView: View {
//    var body: some View {
//        Text("Folders Screen")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundColor(.white)
//    }
//}
//
//struct ProfileView: View {
//    var body: some View {
//        Text("Profile Screen")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundColor(.white)
//    }
//}
//
//#Preview {
//    ContentView()
//}
