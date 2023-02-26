//
//  DateModel.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 15/02/23.
//

import SwiftUI

struct DateModel: Identifiable ,Equatable{
    var id = UUID()
    var date =  String()
    var day = String()
    
    func addFakeDates() -> [DateModel] {
        var arr = [DateModel]()
        arr.append(DateModel(date: "8", day: "Mo"))
        arr.append(DateModel(date: "9", day: "To"))
        arr.append(DateModel(date: "10", day: "We"))
        arr.append(DateModel(date: "11", day: "Th"))
        arr.append(DateModel(date: "12", day: "Fr"))
        arr.append(DateModel(date: "13", day: "Sa"))
        arr.append(DateModel(date: "14", day: "Su"))
        return arr
    }
}


