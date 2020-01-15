//
//  Menu.swift
//  dash
//
//  Created by Ben Dixon on 15/01/2020.
//  Copyright © 2020 NURO. All rights reserved.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        SheetNavBar()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Menu().environment(\.colorScheme, .light)
            Menu().environment(\.colorScheme, .dark)
        }
    }
}
