//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var securityQ1: MenuItem? = nil
    @State private var securityQ2: MenuItem? = nil
    @State private var securityQ3: MenuItem? = nil
    
//    let hobbyCategories: [MenuItem] = [
//        .init(title: "Listening to Music", iconName: "headphones"),
//        .init(title: "Going to the Movies", iconName: "ticket.fill"),
//        .init(title: "Playing Games", iconName: "gamecontroller.fill"),
//        .init(title: "Stand-up Comedy", iconName: "music.mic"),
//        .init(title: "Photography", iconName: "camera.fill"),
//        .init(title: "Reading", iconName: "books.vertical.fill"),
//        .init(title: "Cycling", iconName: "bicycle"),
//        .init(title: "Traveling", iconName: "tram.fill"),
//        .init(title: "Investing", iconName: "bitcoinsign.square.fill")
//    ]

    let hobbyCategories: [MenuItem] = [
        .init(title: "Listening to Music"),
        .init(title: "Going to the Movies"),
        .init(title: "Playing Games"),
        .init(title: "Stand-up Comedy"),
        .init(title: "Photography"),
        .init(title: "Reading"),
        .init(title: "Cycling"),
        .init(title: "Traveling"),
        .init(title: "Investing"),
    ]
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    DropdownMenu(
                        title: "Hobby 1",
                        menuItems: hobbyCategories,
                        selectedItem: $securityQ1,
                        scrollToTopOnClear: true,
                        excludedItems: securityQ1, securityQ2, securityQ3
                    )
                    
                    DropdownMenu(
                        title: "Hobby 2",
                        menuItems: hobbyCategories,
                        selectedItem: $securityQ2,
                        scrollToTopOnClear: true,
                        excludedItems: securityQ1, securityQ2, securityQ3
                    )
                    
                    DropdownMenu(
                        title: "Hobby 3",
                        menuItems: hobbyCategories,
                        selectedItem: $securityQ3,
                        scrollToTopOnClear: true,
                        excludedItems: securityQ1, securityQ2, securityQ3
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Hobbies")
            .background(Color.bgPrimary.ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
