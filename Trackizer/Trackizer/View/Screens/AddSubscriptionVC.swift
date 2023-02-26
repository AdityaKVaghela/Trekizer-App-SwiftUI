//
//  AddSubscriptionVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI


struct AddSubscriptionVC: View {
    
    
    @State var go = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var goOther = false
    @State var currentIndex : Int = 1
    @State var description = ""
    @State var ToSubscriptionInfo = false
    
    //    @State var currentIndex = 0
    
    
    
    
    var body: some View {
        
        let imgArr = [CarouselImage( image: APP.Images.spotify, title: APP.StringLiterals.spotify, subscriptionPrice: "$5.99"),CarouselImage( image: APP.Images.hbo, title: APP.StringLiterals.hbo, subscriptionPrice: "$11.99"),CarouselImage( image: APP.Images.YTLogo, title: APP.StringLiterals.yt, subscriptionPrice: "$5.99"),CarouselImage( image: APP.Images.oneDrive, title: APP.StringLiterals.onedrive, subscriptionPrice: "$9.99"),CarouselImage( image: APP.Images.netFlix, title: APP.StringLiterals.netflix, subscriptionPrice: "$7.99")]
//        NavigationView {
            ZStack{
                NavigationLink("",destination: SubscriptionInfoVC(carouselImage:imgArr[currentIndex]), isActive: $ToSubscriptionInfo)
                VStack{
                    //
                    ZStack{
                       
                        VStack{
                            Text(APP.StringLiterals.addNewSub)
                                .foregroundColor(.white)
                                .font(getFont(.interBold, size: 40))
                                .multilineTextAlignment(.center)
                                .frame(width: 400,height: 100)
                                .padding(.top,80)
                            
                            Spacer()
                            ACarousel(imgArr,
                                      index: $currentIndex,
                                      spacing: 10,
                                      headspace: 75,
                                      sidesScaling: 0.8,
                                      isWrap: true,
                                      autoScroll: .inactive) { image in
                                image.image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 164,height: 164)
                                    .cornerRadius(30)
                            }
                                      .frame(height: 164)
                                      .onTapGesture {
                                          ToSubscriptionInfo = true
                                      }
                            Spacer()
                            Text(imgArr[currentIndex].title)
                                .foregroundColor(.white)
                                .font(getFont(.interSemiBold,size: 14))
                                .padding(.bottom)
                            
                        }
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/1.71)
                        .background(APP.Colors.secondaryBack)
                        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text(APP.StringLiterals.description)
                            .foregroundColor(APP.Colors.grayFont)
                            .font(getFont(.interMedium))
                        TextField("", text: $description)
                            .placeholder(when: description.isEmpty) {
                                Text("Enter description").foregroundColor(APP.Colors.dateBackground)
                            }
                            .foregroundColor(APP.Colors.grayFont)
                            .font(getFont(.interRegular,size: 14))
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width - 48 , height: 48)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(APP.Colors.appGray, lineWidth: 2)
                            )
                        
                        
                        
                        
                    }
                    Spacer()
                    
                    HStack(alignment: .center){
                        Button {
                            print("minus")
                        } label: {
                            APP.Images.minus
                        }.frame(width: 48,height: 48)
                        Spacer()
                        VStack(spacing: 8){
                            Text(APP.StringLiterals.monthlyPrice)
                                .font(getFont(.interSemiBold))
                                .foregroundColor(APP.Colors.grayFont)
                            Text(imgArr[currentIndex].subscriptionPrice)
                                .font(getFont(.interBold,size: 24))
                                .foregroundColor(.white)
                            
                            RoundedRectangle(cornerRadius: 1)
                                .foregroundColor(APP.Colors.grayFont)
                                .frame(width: 150,height: 1)
                            
                            
                        }
                        Spacer()
                        Button {
                            print("plus")
                        } label: {
                            APP.Images.plus
                        }.frame(width: 48,height: 48)
                    }.frame(width: UIScreen.main.bounds.width - 48)
                    
                    Spacer()
                    
                    Button {
                        print("Add This Plateform")
                    } label: {
                        CustomButton(title: APP.StringLiterals.addThisPlateform)
                    }
                    
                    Spacer()
                    
                    
                    
                }.edgesIgnoringSafeArea(.all)
                    
                    .background(APP.Colors.appBackground)
                    .onAppear{
                        print(currentIndex)
                    }
//            }
        }.navigationBarHidden(true)
        .overlay(alignment : .top) {
                CustomNavigationView(goOther: $goOther,title:APP.StringLiterals.new, hasBackButton: true,hasTitle: true,hasSettingButton: false)
            }
        
    }
}

struct AddSubscriptionVC_Previews: PreviewProvider {
    static var previews: some View {
        AddSubscriptionVC()
    }
}
