//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DropdownMenu(menuItems: MenuItem.mockMenuItems)
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
