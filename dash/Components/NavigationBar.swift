//
//  NavigationBar.swift
//  dash
//
//  Created by Ben Dixon on 15/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    @State var showDashboardsList: Bool = false
    @State var showAddWidget: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.showDashboardsList = true
            }) {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.primary)
                    .font(.title)
            }
            .padding(.all)
            .sheet(isPresented: self.$showDashboardsList) {
                Menu()
            }
            
            Text("Dashboard".uppercased())
                .kerning(16)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.all)
            
            Spacer()
            
            Button(action: {
                self.showAddWidget = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.primary)
                    .font(.title)
            }
            .padding(.all)
            .sheet(isPresented: self.$showAddWidget) {
                AddWidget()
            }
        }
        .padding(.all)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBar().environment(\.colorScheme, .light)
            NavigationBar().environment(\.colorScheme, .dark)
        }
    }
}
