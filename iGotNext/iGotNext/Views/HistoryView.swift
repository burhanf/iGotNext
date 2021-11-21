//
//  HistoryView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        List {
            Text("Soccer game 2020/10/30")
            Text("Volley game 2020/10/28")
            Text("Basketball game 2020/10/15")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
