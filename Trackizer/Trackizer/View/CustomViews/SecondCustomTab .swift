//
//  SecondCustomTab .swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 13/02/23.
//

import SwiftUI

struct SecondCustomTab: View {
    @Binding var selectedTab : segmentEnum
//    var segEnum = segmentEnum(rawValue: <#String#>)
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: UIScreen.main.bounds.width - 50 , height: 50).frame(width: UIScreen.main.bounds.width - 50 , height: 50)
                .foregroundColor(APP.Colors.darkGray)
            HStack{
                Button {
                    selectedTab = .subscription
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(selectedTab == segmentEnum.subscription ? APP.Colors.appBackground :APP.Colors.darkGray)
                        Text(segmentEnum.subscription.rawValue)
                            .font(getFont(.interSemiBold))
                            .foregroundColor(.white)
                        
                    }                }
                Button {
                    selectedTab = .bills
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(selectedTab == segmentEnum.bills ? APP.Colors.appBackground : APP.Colors.darkGray)
                        Text(segmentEnum.bills.rawValue)
                            .font(getFont(.interSemiBold))
                            .foregroundColor(.white)
                        
                    }
                    
                }
             

            }
            .frame(width: UIScreen.main.bounds.width - 68,height: 36)
//            .background(.white)
        }.frame(width: UIScreen.main.bounds.width - 50 , height: 50)
    }
}

struct SecondCustomTab__Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomTab(selectedTab: .constant(.subscription))
    }
}
