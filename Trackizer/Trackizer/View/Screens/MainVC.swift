//
//  MainVC.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI


struct MainVC: View {
    @State var selectedTab : tabItem = .home
    @State var goToAdd : Bool = false
    
    
    
    init(){
            UINavigationBar.setAnimationsEnabled(false)
        }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                NavigationLink("",destination: AddSubscriptionVC(currentIndex: 1), isActive: $goToAdd)
                switch selectedTab {
                case .home:
                    HomeVC()
                case .budgets:
                    BudgetVC()
                case .calendar:
                    CalendarVC()
                case .credit:
                    CreditVC()
                    
                }
                TabBar(selectedTab: $selectedTab, goToAdd: $goToAdd)
                    .padding(.bottom,8)
                    
            }
        }
        .transition(.opacity)
//        .animation(.none)
    }
}

struct MainVC_Previews: PreviewProvider {
    static var previews: some View {
        MainVC()
    }
}
