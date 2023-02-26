//
//  HomeVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI


struct HomeVC: View {
    
    
    
    @State var goBack = false
    @State var goOther = false
    @State var seeUrBudget = false
    @State var selectedSegment : segmentEnum = .subscription
    @State var progressvalue : Float = 0.4
    @State var subScriptionData = [SubsciptionModel]()
    @State var BillData = [UpcomiongBillModel]()
    
    
//    UITableView.appearance().backgroundColor = UIColor(named: "AppBackground")
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    VStack{
                      Spacer()
                        Spacer()
                        CirculerProgressBar(seeUrBudget: $seeUrBudget,progressValue: $progressvalue)
                        //                            .padding(.top,30)
                        
                        HStack(spacing: 8){
                            CustomCardView(subCount: "12")
                            
                            CustomCardView(cardColor: .purple,title: APP.StringLiterals.highestSubs)
                            
                            CustomCardView(cardColor: .cyan,title: APP.StringLiterals.lowestSubs,subCount: "$5.99")
                        }.padding(.bottom , 24)
                        
                        
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/1.8)
                .background(APP.Colors.secondaryBack)
                .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                
                SecondCustomTab(selectedTab: $selectedSegment)
                    .padding(.vertical ,16)
                //                Spacer()
                
                switch selectedSegment{
                case .subscription:
                    List(subScriptionData) { datum in
                        subscriptionCell(subModel: datum)
    //                        .padding(.bottom , 0)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 1, leading: 24, bottom: 8, trailing: 24))
                        
            
                    }.foregroundColor(APP.Colors.appBackground)
    //                    .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                        .listRowSeparator(.hidden)
                        .padding(.bottom ,90)
                case .bills :
                    List(BillData) { datum in
                        upcomingBillCell(billModel: datum)
    //                        .padding(.bottom , 0)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 1, leading: 24, bottom: 8, trailing: 24))
                        
            
                    }.foregroundColor(APP.Colors.appBackground)
    //                    .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                        .listRowSeparator(.hidden)
                        .padding(.bottom ,90)
                }
                
                
                   

                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            .background(APP.Colors.appBackground)
            .onChange(of: goOther) { goOther in
                
                print("BACKKKKK")
                
            }
            .onChange(of: seeUrBudget) { seeUrBudget in
                
                print("seeUrBudget")
                
            }
        }.onAppear{
            self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.spotify, subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99"))
            self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.yt, subscriptionName: APP.StringLiterals.yt, subscriptionPrice: "$5.99"))
            self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.oneDrive, subscriptionName: APP.StringLiterals.onedrive, subscriptionPrice: "$4.99"))
            self.subScriptionData.append(SubsciptionModel(subscriptionImage: APP.Images.netFlix, subscriptionName: APP.StringLiterals.netflix, subscriptionPrice: "$4.99"))
            
            self.BillData.append(UpcomiongBillModel(subscriptionDate: "3", subscriptionMonth: "Jun", subscriptionName: APP.StringLiterals.spotify, subscriptionPrice: "$9.99"))
            self.BillData.append(UpcomiongBillModel(subscriptionDate: "4", subscriptionMonth: "Jun", subscriptionName: APP.StringLiterals.onedrive, subscriptionPrice: "$4.99"))
            self.BillData.append(UpcomiongBillModel(subscriptionDate: "22", subscriptionMonth: "Jul", subscriptionName: APP.StringLiterals.netflix, subscriptionPrice: "$5.99"))
            self.BillData.append(UpcomiongBillModel(subscriptionDate: "12", subscriptionMonth: "Aug", subscriptionName: APP.StringLiterals.yt, subscriptionPrice: "$9.99"))



            
        }
        
        .overlay(alignment : .top) {
            CustomNavigationView(goOther: $goOther,hasBackButton: false,hasTitle: false)
        }
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}
