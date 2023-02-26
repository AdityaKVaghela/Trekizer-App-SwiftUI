//
//  subscriptionCell.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 14/02/23.
//

import SwiftUI

struct subscriptionCell: View {
    var subModel = SubsciptionModel(subscriptionImage: APP.Images.spotify, subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99")
    var body: some View {
        //        ZStack{
        //            APP.Colors.appBackground
        //                .ignoresSafeArea()
        VStack(spacing: 0){
            HStack{
                subModel.subscriptionImage
                    .resizable()
                    .frame(width: 40,height: 40)
                    .padding(.leading,12)
                
                Text(subModel.subscriptionName)
                    .font(getFont(.interSemiBold))
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
                Text(subModel.subscriptionPrice)
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
    //    }
}

struct subscriptionCell_Previews: PreviewProvider {
    static var previews: some View {
        subscriptionCell()
    }
}
