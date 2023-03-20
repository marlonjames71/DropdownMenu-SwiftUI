//
//  SelectionHighlight.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/19/23.
//

import SwiftUI

struct SelectionHighlight: View {
    enum Style: CGFloat {
        case pressed = 0.15
        case normal = 1.0
        
        var opacity: CGFloat {
            return self.rawValue
        }
    }
    
    let color: Color
    let style: Style
    let padding: Bool
    
    init(color: Color, style: Style = .pressed, padding: Bool = true) {
        self.color = color
        self.style = style
        self.padding = padding
    }
    
    var body: some View {
        color
            .opacity(style.opacity)
            .mask(RoundedRectangle(cornerRadius: padding ? 12 : 0, style: .continuous))
            .padding(.horizontal, padding ? 6 : 0)
    }
}

struct SelectionHighlight_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // STYLE: PRESSED
            SelectionHighlight(color: .orange)
                .frame(height: 50)
                .border(.secondary.opacity(0.2))
            
            SelectionHighlight(color: .blue, padding: false)
                .frame(height: 50)
                .border(.secondary.opacity(0.2))
            
            // STYLE: NORMAL
            SelectionHighlight(color: .orange, style: .normal)
                .frame(height: 50)
                .border(.secondary.opacity(0.2))
            
            SelectionHighlight(color: .blue, style: .normal, padding: false)
                .frame(height: 50)
                .border(.secondary.opacity(0.2))
        }
        .padding(.horizontal)
    }
}
