//
//  WatchGameViewModel.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//This class is to make a view model for the watch in order to connect to the phone
//

import UIKit

final class WatchGameViewModel: ObservableObject {
    private(set) var connectivityProvider: ConnectionProvider
   
    init(connectivityProvider: ConnectionProvider) {
        self.connectivityProvider = connectivityProvider
        self.connectivityProvider.connect()
    }
}
