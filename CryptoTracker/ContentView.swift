//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accent")
                    .foregroundColor(Color.theme.accent)
                Text("Accent")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Accent")
                    .foregroundColor(Color.theme.red)
                Text("Accent")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
