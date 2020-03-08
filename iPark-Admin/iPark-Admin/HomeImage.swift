//
//  HomeImage.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 3/6/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct HomeImage: View {
    var image :Image
    
    var body: some View {

        image.resizable().frame(width: 425, height: 350)
        
    }
}

struct HomeImage_Previews: PreviewProvider {
    static var previews: some View {
        HomeImage(image: Image("homeimage"))
    }
}
