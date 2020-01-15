//
//  ContentView.swift
//  dash
//
//  Created by Ben Dixon on 14/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .center) {
            NavigationBar()
            
            HStack {
                Widget(
                    title: "Title",
                    subtitle: "Subtitle",
                    barColor: Color(.systemRed),
                    progress: CGFloat.random(in: 0.25 ... 0.85)
                )
                .padding()
                
                Widget(
                    title: "Title",
                    subtitle: "Subtitle",
                    barColor: Color(.systemGreen),
                    progress: CGFloat.random(in: 0.4 ... 0.7)
                )
                .padding()
                
                Widget(
                    title: "Title",
                    subtitle: "Subtitle",
                    barColor: Color(.systemBlue),
                    progress: CGFloat.random(in: 0.1 ... 0.6)
                )
                .padding()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.colorScheme, .light)
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
