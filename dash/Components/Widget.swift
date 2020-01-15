//
//  Widget.swift
//  dash
//
//  Created by Ben Dixon on 15/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct Widget: View {
    let title: String
    let subtitle: String
    let barColor: Color
    let progress: CGFloat
    
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
            }
            .padding(.bottom)
            
            HStack {
                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 16)
                        .opacity(0.1)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(barColor, lineWidth: 16)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring())
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

struct Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Widget(
                title: "Title",
                subtitle: "Subtitle",
                barColor: Color(.systemRed),
                progress: CGFloat.random(in: 0.25 ... 0.85)
            ).environment(\.colorScheme, .light)
            Widget(
                title: "Title",
                subtitle: "Subtitle",
                barColor: Color(.systemRed),
                progress: CGFloat.random(in: 0.25 ... 0.85)
            ).environment(\.colorScheme, .dark)
        }
    }
}
