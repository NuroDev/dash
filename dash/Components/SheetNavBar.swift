//
//  SheetNavBar.swift
//  dash
//
//  Created by Ben Dixon on 15/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct SheetNavBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .font(.title)
                        .padding(.all)
                }
                .padding(.all)
            }
            
            Spacer()
        }
    }
}

struct SheetNavBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SheetNavBar().environment(\.colorScheme, .light)
            SheetNavBar().environment(\.colorScheme, .dark)
        }
    }
}
