//
//  SwiftUIView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI

struct CalendarVC: View {
    @State var goOther = false
    @State var dateArr = [DateModel]()
    @State var gridLayout: [GridItem] = [ GridItem() , GridItem()]
    @State var subScriptionData = [SubsciptionModel]()
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    VStack(spacing: 22){
                        HStack{
                            Text(APP.StringLiterals.subschedule)
                                .foregroundColor(.white)
                                .font(getFont(.interBold,size: 40))
                                .frame(width: UIScreen.main.bounds.width / 2,height: 100)
                            
                            Spacer()
                        }
                        HStack{
                            Text(APP.StringLiterals.threeSubFor)
                                .foregroundColor(APP.Colors.grayFont)
                                .font(getFont(.interSemiBold,size: 14))
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                HStack(alignment: .center,spacing: 4){
                                    Text(APP.StringLiterals.january)
                                        .foregroundColor(.white)
                                        .font(getFont(.interSemiBold,size: 12))
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                }.frame(width: 90,height: 32)
                                    .background(APP.Colors.appGray)
                                    .cornerRadius(25)
                            }.padding(.trailing)
                        }
                        //                        Spacer()
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing: 8){
                                ForEach(dateArr) { model in
                                    CalanderView(currentDate: model == dateArr.first ? true : false,datemodel: model)
                                }
                            }.padding()
                        }
                        
                        
                        
                    }.padding(.top,60)
                        .padding(.leading,22)
                }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/1.8)
                .background(APP.Colors.secondaryBack)
                .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                ScrollView(showsIndicators: false){
                    
                    HStack{
                        VStack(alignment: .leading,spacing: 4){
                            Text(APP.StringLiterals.january)
                                .font(getFont(.interBold,size: 20))
                                .foregroundColor(.white)
                            Text(APP.StringLiterals.randomDate)
                                .font(getFont(.interMedium,size: 12))
                                .foregroundColor(APP.Colors.grayFont)
                        }
                        Spacer()
                        VStack(alignment: .trailing,spacing: 4){
                            Text("24.99")
                                .font(getFont(.interBold,size: 20))
                                .foregroundColor(.white)
                            Text(APP.StringLiterals.inUpcomingBills)
                                .font(getFont(.interMedium,size: 12))
                                .foregroundColor(APP.Colors.grayFont)
                        }
                    }
                    .padding(.vertical,20)
                    
                    LazyVGrid(columns: gridLayout, alignment: .center,spacing: 8) {
                        ForEach(subScriptionData) { model in
                            CalanderCell(subModel: model)
                        }
                        
                    }
                    
                }.padding(.horizontal,24)
                    .padding(.bottom,80)
                
                Spacer()
            }  .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .background(APP.Colors.appBackground)
                .onChange(of: goOther) { goOther in
                    
                    print("BACKKKKK")
                    
                }
            
        }.onAppear{
            addFakeData()
            
        }.overlay(alignment : .top) {
            CustomNavigationView(goOther: $goOther,title:APP.StringLiterals.calendar, hasBackButton: false,hasTitle: true)
        }
        
    }
    //MARK: - Private Funcs
    func addFakeData()
    {
        self.dateArr = DateModel().addFakeDates()
        self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.spotify, subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99"))
        self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.yt, subscriptionName: APP.StringLiterals.yt, subscriptionPrice: "$5.99"))
        self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.oneDrive, subscriptionName: APP.StringLiterals.onedrive, subscriptionPrice: "$4.99"))
        self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.netFlix, subscriptionName: APP.StringLiterals.netflix, subscriptionPrice: "$4.99"))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarVC()
    }
}
