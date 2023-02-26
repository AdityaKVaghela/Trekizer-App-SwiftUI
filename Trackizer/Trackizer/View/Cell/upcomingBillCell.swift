//
//  upcomingBillCell.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 14/02/23.
//

import SwiftUI

struct upcomingBillCell: View {
    var billModel = UpcomiongBillModel(subscriptionDate: "25",  subscriptionMonth: "Jun", subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99")
    var body: some View {
        //        ZStack{
        //            APP.Colors.appBackground
        //                .ignoresSafeArea()
        VStack(spacing: 0){
            HStack{
               
                VStack{
                    Text(billModel.subscriptionMonth)
                        .font(getFont(.interMedium,size: 10))
                        .foregroundColor(APP.Colors.grayFont)
                    Text(billModel.subscriptionDate)
                        .font(getFont(.interSemiBold,size: 14))
                        .foregroundColor(APP.Colors.grayFont)
                }
                .frame(width: 40,height: 40)
                
                .background(APP.Colors.dateBackground)
                .cornerRadius(6)
                .padding(.leading,12)
                
                
                
                Text(billModel.subscriptionName)
                    .font(getFont(.interSemiBold))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
                Text(billModel.subscriptionPrice)
                    .font(getFont(.interSemiBold))
                    .foregroundColor(.white)
                    .padding(.trailing , 12)
                
            }.frame(width: UIScreen.main.bounds.width - 48, height: 64)
                .cornerRadius(20)
               
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(APP.Colors.grayFont, lineWidth: 1)
                )
                .background(.clear)
            //            Spacer()
            
        }
        
    }
}

struct upcomingCellView_Previews: PreviewProvider {
    static var previews: some View {
        upcomingBillCell()
    }
}
