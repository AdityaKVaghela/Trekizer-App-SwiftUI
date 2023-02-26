//
//  CreditVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI
struct Imagee : Identifiable{
    var id = UUID()
    var images : Image
}
struct CreditVC: View {
    @State var goOther = false
    @State var imageArr : [Imagee] =  [Imagee(images:APP.Images.spotifyLogo),
                                       Imagee(images:APP.Images.OneDriveLogo),
                                       Imagee(images:APP.Images.YTLogo),
                                       Imagee(images:APP.Images.netFlixLogo)]
    var body: some View {
        NavigationView {
            VStack{
                VirtualCardView()
                    .padding(.top,100)
                Spacer()
                Text(APP.StringLiterals.subscriptions)
                    .foregroundColor(.white)
                    .font(getFont(.interSemiBold,size: 16))
                HStack(alignment: .center, spacing: 8){
                    ForEach(imageArr) { imagee in
                        VStack(alignment: .leading){
                            imagee.images
                                .resizable()
                                .frame(width: 40)
                                .scaledToFit()
//                            Spacer()
                                
                        }.frame(width: 40,height: 40)
                            
                      
                            
                            
                           
                    }
                }
               
                
                Spacer()
                ZStack{
                    VStack{
                        HStack(alignment: .center){
                            Text(APP.StringLiterals.addNewCard)
                                .font(getFont(.interSemiBold))
                                .foregroundColor(APP.Colors.grayFont)
                            APP.Images.plusCirle
                                .foregroundColor(APP.Colors.grayFont)
                        }.frame(width: UIScreen.main.bounds.width - 48,height: 52)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16).strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [6])).foregroundColor(APP.Colors.grayFont)
                            }.padding(.top,12)
                        Spacer()
                    }
                    
                    
                    
                }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/4.39)
                    .background(APP.Colors.secondaryBack)
                    .cornerRadius(25, corners: [.topLeft, .topRight])
            }.edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .background(APP.Colors.appBackground)
                .onChange(of: goOther) { goOther in
                    
                    print("BACKKKKK")
                    
                }
        }.overlay(alignment : .top) {
            CustomNavigationView(goOther: $goOther,title:APP.StringLiterals.creditCard, hasBackButton: false,hasTitle: true)
        }
    }
}

struct CreditVC_Previews: PreviewProvider {
    static var previews: some View {
        CreditVC()
    }
}
