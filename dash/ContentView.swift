//
//  ContentView.swift
//  dash
//
//  Created by Ben Dixon on 14/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct Card: View {
    let title: String
    let subtitle: String
    let barColor: Color
    let progress: CGFloat
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.leading, 6)
                
                Spacer()
                
//                Image(systemName: "line.horizontal.3")
//                    .accentColor(.primary)
//                    .padding(.trailing, 24)
            }
            .padding(.bottom)
         
            HStack {
                ZStack {
                    // 3.
                    Circle()
                        .stroke(Color.gray, lineWidth: 16)
                        .opacity(0.1)
                    // 4.
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(barColor, lineWidth: 16)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring())
                    // 5.
                    .overlay(
                        Text("\(Int(progress * 100.0))%")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                    )
                         
                }
                .frame(height: 128)
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
        .offset(x: self.currentPosition.width, y: self.currentPosition.height)
        .gesture(
            DragGesture().onChanged { value in
                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            }
            .onEnded { value in
                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                print(self.newPosition.width)
                self.newPosition = self.currentPosition
            }
        )
    }
}

struct ContentView: View {
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Text("Dashboard".uppercased())
                    .kerning(16)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .padding(.all)
            }
            .padding(.all)
            
            Spacer()
            
            HStack {
                Card(
                    title: "Title",
                    subtitle: "Subtitle",
                    barColor: Color(.systemRed),
                    progress: CGFloat.random(in: 0.25 ... 0.85)
                )
                .padding()
                
                Card(
                    title: "Title",
                    subtitle: "Subtitle",
                    barColor: Color(.systemGreen),
                    progress: CGFloat.random(in: 0.4 ... 0.7)
                )
                .padding()
                
                Card(
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
