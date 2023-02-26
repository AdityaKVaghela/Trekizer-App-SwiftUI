//
//  VirtualCardView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 15/02/23.
//

import SwiftUI

struct VirtualCardView: View {
    var body: some View {
        ZStack{
            VStack{
                
            }.frame(width:UIScreen.main.bounds.width / 1.6 ,height: UIScreen.main.bounds.height/2.32)
                .background(APP.Colors.tabSelected)
                .cornerRadius(12)
                .offset(x:40,y: 11)
                .rotationEffect(.degrees(11))
               
            VStack{

            }.frame(width:UIScreen.main.bounds.width / 1.6 ,height: UIScreen.main.bounds.height/2.32)
                .background(APP.Colors.tabBack)
                .cornerRadius(12)
               .offset(x:25,y: 9)
                .rotationEffect(.degrees(6))
                
            
            
            ZStack {
                APP.Images.virtualCard
                    .resizable()
                    .scaledToFit()
                    .frame(width:UIScreen.main.bounds.width / 1.6 ,height: UIScreen.main.bounds.height/2.32)
                VStack{
                    VStack(spacing: 16){
                        APP.Images.cardLogo
                            .resizable()
                            .scaledToFit()
                        .frame(width: 56,height: 34)
                        Text(APP.StringLiterals.virtualCard)
                            .font(getFont(.interSemiBold,size: 16))
                            .foregroundColor(.white)
                    }.padding()

                    Spacer()
                    VStack(spacing: 8) {
                        Text(APP.StringLiterals.userName)
                            .font(getFont(.interSemiBold,size: 12))
                            .foregroundColor(APP.Colors.tabSelected)
                        Text(APP.StringLiterals.cardNumber)
                            .font(getFont(.interSemiBold,size: 16))
                            .foregroundColor(.white)

                        Text(APP.StringLiterals.dateAndMonth)
                            .font(getFont(.interSemiBold))
                            .foregroundColor(.white)
                        APP.Images.chip
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,height: 28)
                    }.padding()



                }.frame(width:UIScreen.main.bounds.width / 1.6 ,height: UIScreen.main.bounds.height/2.32)
                    
            }
            
        }.frame(width:UIScreen.main.bounds.width / 1.6 ,height: UIScreen.main.bounds.height/2.32)
        
       
        
    }
}

struct VirtualCardView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualCardView()
    }
}
