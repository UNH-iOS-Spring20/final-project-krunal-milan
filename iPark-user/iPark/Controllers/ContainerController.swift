//
//  ContainerController.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct ContainerController: View {
    var body: some View {
UserPage()
    
}
}
#if DEBUG
struct ContainerController_Previews: PreviewProvider {
    static var previews: some View {
        ContainerController().environmentObject(SessionStore())
    }
}
#endif
