//
//  CustomCardView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 13/02/23.
//

import SwiftUI

struct CustomCardView: View {
    @State var cardColor = APP.Colors.orangeColor
    @State var title = APP.StringLiterals.activeSubs
    @State var subCount = "$19.99"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius : 20)
                .fill(APP.Colors.card)
                .frame(width: 104, height: 64)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(APP.Colors.grayFont, lineWidth: 0.5)
                )
            VStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(cardColor)
                    .frame(width : 60,height: 2)
                    .padding(.top,3)
             
                Text(title)
                    .font(getFont(.interSemiBold))
                    .foregroundColor(APP.Colors.grayFont)
                Spacer()
                Text(subCount)
                    .font(getFont(.interSemiBold,size: 14))
                    .foregroundColor(.white)
                    .padding(.bottom,16)
                
            }
            
            
        }.frame(height: 64)
    }
}

struct CustomCardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardView()
    }
}
