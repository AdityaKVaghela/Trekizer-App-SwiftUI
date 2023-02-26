//
//  CustomNavigationView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 09/02/23.
//

import SwiftUI

struct CustomNavigationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var goOther : Bool
    @State var title = "Get Started"
    @State var hasBackButton = true
    @State var hasTitle = true
    @State var hasSettingButton = true
    @State var toSetting = false
    
    var body: some View {
        ZStack{
            NavigationLink("",destination: SettingVC(), isActive: $toSetting)
            Color(.clear)
            HStack{
                
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    APP.Images.back
                        .foregroundColor(APP.Colors.grayFont)
                    
                    
                    
                } .frame(width: 24, height: 24)
                    .opacity(hasBackButton ? 1 : 0)
                
                Spacer()
                
                Text(title)
                    .font(getFont(.interRegular,size : 16))
                    .foregroundColor(APP.Colors.grayFont)
                    .opacity(hasTitle ? 1 : 0)
                
                
                Spacer()
                
                Button {
//                    self.goOther = !self.goOther
                    self.toSetting = true
                    
                } label: {
                    APP.Images.settings
                        .foregroundColor(APP.Colors.grayFont)
                    
                } .frame(width: 24, height: 24)
                    .opacity(hasSettingButton ? 1 : 0)
                
                
            }
        }.frame(width: UIScreen.main.bounds.width - 50 , height:  24)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(goOther: .constant(false))
    }
}
