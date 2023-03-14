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
            ForEach(MenuItem.mockMenuItems) { item in
                if let icon = item.iconName {
                    Label(item.title, systemImage: icon)
                } else {
                    Text(item.title)
                }
            }
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
