//
//  LaunchView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 02/03/2023.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var showLoadingText: Bool = false
    @State private var counter = 0
    @State private var loops = 0
    @Binding var showLaunchView: Bool
    private let timer = Timer.publish(every: 0.08, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .foregroundColor(Color.launch.accent)
                                .fontWeight(.heavy)
                                .offset(y: counter == index ? -7 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
