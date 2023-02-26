//
//  SignInController.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 08/02/23.
//

import SwiftUI

struct SignInController: View {
    @State var txtEmail = ""
    @State var txtPassword = ""
    @State var isChecked = false
    @State var isValidate = false
    @State var go = false
    @State var toTheMains = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        
        ZStack{
            NavigationLink("", destination : LaunchScreens(),isActive: $go)
            NavigationLink("", destination : MainVC(),isActive: $toTheMains)
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
                VStack(spacing: 16){
                    CustomTextField(names :APP.StringLiterals.login , values: $txtEmail)
                    SegmentedProgressView(password: $txtPassword, isValidate: $isValidate)
                }
                .padding(.bottom,24)
                
                HStack(){
                    HStack{
                        CustomCheckBoxView(checked: $isChecked)
                        Text(APP.StringLiterals.rememberMe)
                            .font(getFont(.interMedium))
                            .foregroundColor(APP.Colors.grayFont)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text(APP.StringLiterals.forgotPassword)
                            .font(getFont(.interMedium))
                            .foregroundColor(APP.Colors.grayFont)
                    }
                    
                }.frame(width: UIScreen.main.bounds.width - 50)
                    .padding(.bottom,24)
                Button {
                    self.toTheMains = true
                } label: {
                    CustomButton(title: APP.StringLiterals.signIn)
                    
                }.disabled(!isValidate)
                
                
                
                Spacer()
                VStack(spacing: 20){
                    Text(APP.StringLiterals.accouuntYet)
                        .font(getFont(.interRegular))
                        .foregroundColor(.white)
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        CustomButton(color :APP.Colors.appGray ,  title: APP.StringLiterals.signUp)
                    }
                }
                .padding(.bottom,30)
                
                
                
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        }
        //        .navigationBarBackButtonHidden(true)
    }
}

struct SignInController_Previews: PreviewProvider {
    static var previews: some View {
        SignInController()
    }
}
