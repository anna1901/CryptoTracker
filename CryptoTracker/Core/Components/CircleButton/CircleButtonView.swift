//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 07/02/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: .theme.accent,
                radius: 10, x: 0, y: 0
            )
            .padding()
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "info")
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
