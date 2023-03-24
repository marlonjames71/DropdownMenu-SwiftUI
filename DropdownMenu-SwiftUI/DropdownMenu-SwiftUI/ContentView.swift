//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var securityQ1: MenuItem? = nil
    
    var body: some View {
        VStack {
            DropdownMenu(
                title: "Security Question 1",
                menuItems: MenuItem.mockMenuItems,
                selectedItem: $securityQ1,
                provideResetButton: true
            )
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BG-Primary").ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
