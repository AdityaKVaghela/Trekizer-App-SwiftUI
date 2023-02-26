//
//  SubscriptionInfoVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 20/02/23.
//

import SwiftUI

struct SubscriptionInfoVC: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var carouselImage = CarouselImage(image: APP.Images.spotify, title: APP.StringLiterals.spotify, subscriptionPrice: "$5.99")
    
    var body: some View {
       
            
            ZStack{
                
                HStack{
                    Circle().fill(APP.Colors.darkGray).frame(width: 50)
                    Spacer()
                    Circle().fill(APP.Colors.darkGray).frame(width: 50)
                }.zIndex(1)
                VStack(spacing: 0){
                   
                    VStack{
                        HStack{
                            Button {
                                self.mode.wrappedValue.dismiss()
                            } label: {
                                APP.Images.down
                            }.frame(width: 24,height: 24)
                            Spacer()
                            Text(APP.StringLiterals.subscriptionInfo)
                                .font(getFont(.interRegular,size: 16))
                                .foregroundColor(APP.Colors.grayFont)
                            Spacer()
                            Button {
                                print("Down")
                            } label: {
                                APP.Images.trash
                            }.frame(width: 24,height: 24)
                            
                            
                            
                        }.padding(.horizontal,24)
                            .padding(.top,32)
                        Spacer()
                        carouselImage.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 106,height: 106)
                        VStack(spacing: 4) {
                            Text(carouselImage.title)
                                .font(getFont(.interBold,size: 32))
                                .foregroundColor(.white)
                            Text(carouselImage.subscriptionPrice)
                                .font(getFont(.interBold,size: 20))
                                .foregroundColor(APP.Colors.grayFont)
                            
                        }
                        
                        Spacer()
                        VStack(spacing: 0){
                            Line()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [7]))
                            
                                .foregroundColor(.black)
                                .frame(height: 1)
                            Line()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [7]))
                            
                                .foregroundColor(.black)
                                .frame(height: 1)
                            
                        }
                        
                    }.frame(width: UIScreen.main.bounds.width - 48,height:UIScreen.main.bounds.height/2.43)
                        .background(APP.Colors.dateBackground)
                        .cornerRadius(30, corners: [.topLeft,.topRight])
                    
                    
                    VStack{
                        ScrollView(.vertical){
                            VStack(spacing: 16){
                                
                                HStack{
                                    Text(APP.StringLiterals.name)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text(carouselImage.title)
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                    .padding(.top,20)
                                HStack{
                                    Text(APP.StringLiterals.description)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text("Music APP")
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                HStack{
                                    Text(APP.StringLiterals.category)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text("Entertainment")
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                HStack{
                                    Text(APP.StringLiterals.firstPayment)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text(APP.StringLiterals.randomDate)
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                HStack{
                                    Text(APP.StringLiterals.reminder)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text("never")
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                HStack{
                                    Text(APP.StringLiterals.currency)
                                        .font(getFont(.interSemiBold,size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        Text("USD ($)")
                                            .font(getFont(.interMedium))
                                            .foregroundColor(APP.Colors.grayFont)
                                        APP.Images.vector
                                    }
                                    
                                    
                                }.padding(.horizontal)
                                    .padding(.bottom,20)
                            }
                            
                        }.frame(width: UIScreen.main.bounds.width - 100)
                            .background(APP.Colors.card)
                            .cornerRadius(12)
                            .padding(.vertical)
                        
                        Spacer()
                        Button {
                            
                        } label: {
                            CustomButton(color: APP.Colors.card, title: APP.StringLiterals.save,widthToMinus: 100)
                            
                        }.padding(.vertical)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 48,height:UIScreen.main.bounds.height/2.43)
                    .background(APP.Colors.secondaryBack)
                    .cornerRadius(30, corners: [.bottomLeft,.bottomRight])
                    
                    
                    //                Spacer()
                }.edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    .background(APP.Colors.darkGray)
            }.navigationBarHidden(true)
        
        
    }
}

struct SubscriptionInfoVC_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionInfoVC()
    }
}
