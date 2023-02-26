//
//  CustomSegment.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 13/02/23.
//

import SwiftUI


struct CustomSegment: View {
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
       
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont.boldSystemFont(ofSize: 12),
                .foregroundColor: UIColor.white
            ], for: .selected)
        
       
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont.boldSystemFont(ofSize: 12),
                .foregroundColor: UIColor.white
            ], for: .normal)
        
        
    }
    @State var segmentationSelection : segmentEnum = .subscription
    var body: some View {
        VStack{
            
        Picker("", selection: $segmentationSelection) {
            ForEach(segmentEnum.allCases, id: \.self) { option in
                Text(option.rawValue)
                   
            }
        }.pickerStyle(SegmentedPickerStyle())
             // here
            .listRowInsets(.init())
            .listRowInsets(EdgeInsets(top: 12, leading: 0, bottom:12, trailing: 0))
            .listRowBackground(Color.white) // demo
//            .frame(width: UIScreen.main.bounds.width - 100,height: 50)
        }.background(.red)
    }
}

struct CustomSegment_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegment()
            .padding()
    }
}
