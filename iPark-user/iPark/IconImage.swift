//
//  IconImage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct IconImage: View {
    
         var image :Image
            
            var body: some View {

                image.resizable().frame(width: 40, height: 40).clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 5)
                
                
            }
        }
    


struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage(image: Image("homeimage"))
    }
}
