//
//  GameInfoModalView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI

struct GameInfoModalView: View {
    var body: some View {
        VStack{
            Image("basketball")
                .resizable()
                .frame(width: 300, height: 100, alignment: .top)
            Text("Start time: 11:00")
            Text("End time: 12:00")
            Text("Organized by: Amir")
            Text("Number of spots available: 3/12")
            
        }.navigationTitle("Game info modal")
    }
}

struct GameInfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoModalView()
    }
}