//
//  WatchGameViewModel.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//

import UIKit

final class WatchGameViewModel: NSObject {
    private(set) var connectivityProvider: ConnectionProvider
   // var textFieldValue: String = ""
    
    init(connectivityProvider: ConnectionProvider) {
        self.connectivityProvider = connectivityProvider
        self.connectivityProvider.connect()
    }
  /*
    func sendMessage() -> Void {
        let txt = textFieldValue
        let message = ["message":txt]
        connectivityProvider.send(message: message)
    }*/
}
