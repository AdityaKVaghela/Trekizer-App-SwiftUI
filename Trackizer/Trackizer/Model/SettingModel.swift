//
//  SettingModel.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 22/02/23.
//

import SwiftUI

struct SettingModel : Identifiable,Equatable{
    var id = UUID()
    var icon : Image
    var title : String
    var currentVal : String
}
