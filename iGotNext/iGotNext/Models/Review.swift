//
//  Review.swift
//  iGotNext
//
//  Created by Michael on 2021-12-04.
//

import UIKit
import MapKit

class Review: NSObject {
    let id = UUID()
    var reviewContent : String?

    init(reviewContent : String) {
        self.reviewContent = reviewContent
        super.init()
    }
}
