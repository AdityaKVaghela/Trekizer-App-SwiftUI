//
//  SubsciptionModel.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 14/02/23.
//

import SwiftUI

struct SubsciptionModel : Identifiable{
    var id = UUID()
    var subscriptionImage : Image
    var subscriptionName  : String
    var subscriptionPrice  : String
    
}

struct CarouselImage : Identifiable {
    var id = UUID()
    var image: Image
    var title : String
    var subscriptionPrice : String
}
