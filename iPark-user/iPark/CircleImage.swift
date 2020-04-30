//
//  Circleimage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 3/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct Circleimage: View {
    var image :Image
    
    var body: some View {

        image.resizable().frame(width: 420, height: 320)
        
    }
}

struct Circleimage_Previews: PreviewProvider {
    static var previews: some View {
        Circleimage(image: Image("homeimage"))
    }
}
