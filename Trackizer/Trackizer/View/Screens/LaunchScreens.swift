//
//  LaunchScreens.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 01/02/23.
//

import SwiftUI

struct LaunchScreens: View {
    var body: some View {
        NavigationView {
            
            ZStack {
//                NavigationLink("", isActive: <#T##Binding<Bool>#>, destination: SignUpController())
//                NavigationLink("", isActive: <#T##Binding<Bool>#>, destination: SignInController())
                APP.Images.welcomeScreenImage
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    APP.Images.logo
                        .padding(.top,60)
                    
                    Spacer()
                    
                    Text(APP.StringLiterals.WelcomDiscription)
                        .font(getFont(.interRegular))
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom,37)
                    
                    
                    VStack(alignment: .center, spacing: 20) {
                        NavigationLink {
                            SignUpController()
                        } label: {
                            CustomButton(title: APP.StringLiterals.getStarted)
                        }
                        NavigationLink {
                            SignInController()
                        } label: {
                            CustomButton(color: APP.Colors.appGray, title: APP.StringLiterals.iHaveAnAccount)
                        }
                    }.padding(.bottom, 30)
                    
                    
                }
                
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            }
            
        }
    }
}

struct LaunchScreens_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreens()
    }
}
