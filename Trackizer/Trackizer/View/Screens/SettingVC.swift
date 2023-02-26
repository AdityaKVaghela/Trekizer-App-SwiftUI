//
//  SettingVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 21/02/23.
//

import SwiftUI

struct SettingVC: View {
    @State var goOther = false
    @State var switchIsOn = false
    @State var mySubscription = [SettingModel]()
    @State var appearence = [SettingModel]()
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    VStack(spacing: 8) {
                        APP.Images.Apple
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                        Text(APP.StringLiterals.userName)
                            .font(getFont(.interBold,size : 20))
                        
                            .foregroundColor(.white)
                        Text(APP.StringLiterals.userEmail)
                            .font(getFont(.interMedium))
                            .foregroundColor(APP.Colors.grayFont)
                        
                        Button {
                            print("Edit profile")
                        } label: {
                            Text(APP.StringLiterals.editProfile)
                                .font(getFont(.interSemiBold,size: 12))
                                .foregroundColor(.white)
                            
                        }.frame(width:90,height: 32)
                            .background(APP.Colors.appGray)
                            .clipShape(Capsule())
                            .padding()
                        
                    }
                    
                    VStack (spacing: 20){
                        VStack(alignment: .leading) {
                            Text(APP.StringLiterals.general)
                                .font(getFont(.interSemiBold,size: 14))
                                .foregroundColor(.white)
                            VStack(spacing: 20){
                                SettingCell()
                                    .padding(.horizontal)
                                    .padding(.top,20)
                                HStack{
                                    HStack(spacing: 20){
                                        APP.Images.iCloud.frame(width: 20,height: 20)
                                        Text(APP.StringLiterals.iCloudSync).font(getFont(.interSemiBold,size: 14)).foregroundColor(.white)
                                    }
                                    Spacer()
                                    Toggle(isOn: $switchIsOn) {
                                    }
                                }.padding(.horizontal)
                                    .padding(.bottom,20)
                                
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(APP.Colors.card)
                            .cornerRadius(20)
                        }
                        VStack(alignment: .leading) {
                            Text(APP.StringLiterals.mySubscriptions)
                                .font(getFont(.interSemiBold,size: 14))
                                .foregroundColor(.white)
                            VStack(){
                                ForEach(mySubscription) { model in
                                    SettingCell(model: model)
                                        .padding(.horizontal)
                                        .padding(.top)
                                        .padding(.bottom , model == mySubscription.last ? 15 : 0)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(APP.Colors.card)
                            .cornerRadius(20)
                        }
                        VStack(alignment: .leading) {
                            Text(APP.StringLiterals.appearance)
                                .font(getFont(.interSemiBold,size: 14))
                                .foregroundColor(.white)
                            VStack(){
                                ForEach(appearence) { model in
                                    SettingCell(model: model)
                                        .padding(.horizontal)
                                        .padding(.top)
                                        .padding(.bottom , model == appearence.last ? 15 : 0)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(APP.Colors.card)
                            .cornerRadius(20)
                        }
                    }
                    
                }
                
                
            }
            .padding(.top,50)
                .frame(width: UIScreen.main.bounds.width)
                .background(APP.Colors.darkGray)
                    .background(APP.Colors.appBackground)
                   
                    
        }.navigationBarHidden(true)
            .overlay(alignment : .top) {
                CustomNavigationView(goOther: $goOther, title: APP.StringLiterals.setting,hasBackButton: true,hasTitle: true,hasSettingButton: false)
        }.onAppear{
            addFakeData()
        }
    }
    
     func addFakeData(){
        mySubscription.append(SettingModel(icon: APP.Images.sorting, title: APP.StringLiterals.sorting, currentVal: "Date"))
        mySubscription.append(SettingModel(icon: APP.Images.chart, title: APP.StringLiterals.summary, currentVal: "Average"))
        self.mySubscription.append(SettingModel(icon: APP.Images.rect, title: APP.StringLiterals.defaultCurrency, currentVal: "USD ($)"))
        
        
        self.appearence.append(SettingModel(icon: APP.Images.appIcon, title: APP.StringLiterals.appIcon, currentVal: "Default"))
        self.appearence.append(SettingModel(icon: APP.Images.lightTheme, title: APP.StringLiterals.theme, currentVal: "Dark"))
        
        
    }
    
}

struct SettingVC_Previews: PreviewProvider {
    static var previews: some View {
        SettingVC()
    }
}
