//
//  FriendsView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase

struct FriendsView: View {
    var auth = Auth.auth().currentUser?.uid
    var body: some View {
        List {
            
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
