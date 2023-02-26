//
//  Signup2Controller.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 07/02/23.
//

import SwiftUI

struct Signup2Controller: View {
    @State var txtEmail = ""
    @State var txtPassword = ""
    @State var go = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            NavigationLink("", destination : LaunchScreens(),isActive: $go)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button  {
                            self.mode.wrappedValue.dismiss()
                        } label: {
                            Text("Back")
                                .font(getFont(.interSemiBold))
                                .foregroundColor(APP.Colors.grayFont)
                        }
                    }
                }
            
            
            APP.Colors.appBackground 
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                APP.Images.logo
                    .padding(.top,60)
                Spacer()
                VStack(alignment: .leading){
                    CustomTextField(names: APP.StringLiterals.emailAddress, values: $txtEmail)
                        .padding(.bottom,24)
                    CustomTextField(names: APP.StringLiterals.password, values: $txtEmail)
                        .padding(.bottom,16)
                    Text(APP.StringLiterals.passwordValidation)
                        .font(getFont(.interMedium,size: 12))
                        .foregroundColor(APP.Colors.grayFont)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,40)
                    Button {
                        
                    } label: {
                        CustomButton(title: APP.StringLiterals.getStartedFree)
                    }
                }
                Spacer()
                VStack(spacing:20){
                    Text(APP.StringLiterals.alreadyHaveanAccount)
                        .font(getFont(.interMedium,size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                       
                    NavigationLink {
                        SignInController()
                    } label: {
                        CustomButton(color: APP.Colors.appGray, title: APP.StringLiterals.signIn)
                        
                    }
                    
                }.padding(.bottom,30)
                
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Signup2Controller_Previews: PreviewProvider {
    static var previews: some View {
        Signup2Controller()
    }
}
