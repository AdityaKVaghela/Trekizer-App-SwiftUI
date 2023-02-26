//
//  CalanderCell.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 15/02/23.
//

import SwiftUI

struct CalanderCell: View {
    var subModel = SubsciptionModel(subscriptionImage: APP.Images.spotify, subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99")
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                subModel.subscriptionImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .padding(.top,16)
                Spacer()
                VStack(alignment: .leading, spacing: 5){
                    Text(subModel.subscriptionName)
                        .font(getFont(.interSemiBold))
                        .foregroundColor(.white)
                    Text(subModel.subscriptionPrice)
                        .font(getFont(.interBold,size: 20))
                        .foregroundColor(.white)
                        .padding(.bottom,18)
                }
            }.padding(.leading,16)
            Spacer()
            
            
        }.frame(width: (UIScreen.main.bounds.width - 56) / 2,height: (UIScreen.main.bounds.width - 56) / 2)
            .background(APP.Colors.secondaryBack)
            .cornerRadius(16)
    }
}

struct CalanderCell_Previews: PreviewProvider {
    static var previews: some View {
        CalanderCell()
    }
}
