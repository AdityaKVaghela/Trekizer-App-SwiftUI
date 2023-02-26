//
//  SwiftUIView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 15/02/23.
//

import SwiftUI

struct CalanderView: View {
    @State var currentDate = true
    var datemodel = DateModel(date: "6", day: "Sa")
    
    var body: some View {
        VStack{
            Text(datemodel.date)
                .font(getFont(.interBold,size: 20))
                .foregroundColor(.white)
                .padding(.top,15)
            
            Text(datemodel.day)
                .font(getFont(.interMedium,size: 12))
                .foregroundColor(APP.Colors.tabSelected)
            Spacer()
            if currentDate{
                Circle()
                    .frame(width: 6)
                    .foregroundColor(APP.Colors.orangeColor)
                    .padding(.bottom,20)
            }
        
            
        }.frame(width: 48,height: 108)
        .background(currentDate ? APP.Colors.dateSelected : APP.Colors.tabBack)
        .cornerRadius(19)
    }
}

struct CalanderView_Previews: PreviewProvider {
    static var previews: some View {
        CalanderView()
    }
}
