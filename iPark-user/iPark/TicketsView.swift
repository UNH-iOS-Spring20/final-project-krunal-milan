//
//  TicketsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI


struct TicketsView: View {
    @ObservedObject var type = Tickets()
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $type.typeofticketselector, label: Text("")) {
                ForEach(0 ..< type.typeoftickets.count) {
                    Text(self.type.typeoftickets[$0])
              }
           }.pickerStyle(SegmentedPickerStyle()).padding(10)
            Spacer().frame(height: 30)
            if(type.typeofticketselector == 0){
                SingleTicketView()
        }
            if(type.typeofticketselector == 1){
                YearlyPassView()

            }
        }    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
