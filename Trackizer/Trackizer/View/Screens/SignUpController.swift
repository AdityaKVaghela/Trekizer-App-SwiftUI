//
//  SignUpController.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 07/02/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import GoogleSignIn
struct SignUpController: View {
    @State var go = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack {
            NavigationLink("", destination : MainVC(),isActive: $go)
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
            
            
            
            
            
         APP.Images.welcomeScreenImage
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                APP.Images.logo
                    .padding(.top,60)
                
                Spacer()
                VStack(spacing: 8){
                    Button {
                        SocialMediaSignIn.shared.signInWithGoogle { success, err in
                            if success{
                                self.go = true
                            }else{
                                print(err)
                            }
                        }
                    } label: {
                        CustomButton(color: .white, title: APP.StringLiterals.signUpWithGoogle,isImage:  true, Image: APP.Images.google, fontColor: .black)
                    }
                    Button {
                        
                    } label: {
                        CustomButton(color: .black, title: APP.StringLiterals.signUpWithApple,isImage: true,Image: APP.Images.Apple)
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    CustomButton(color: APP.Colors.FbBlue, title: APP.StringLiterals.signUpWithFaceBook,isImage: true,Image: APP.Images.Facebook)
                }
                Text(APP.StringLiterals.or)
                    .multilineTextAlignment(.center)
                    .font(getFont(.interMedium))
                    .foregroundColor(.white)
                    .padding(.vertical,38)
                    
                NavigationLink {
                    Signup2Controller()
                } label: {
                    CustomButton(color: APP.Colors.appGray, title: APP.StringLiterals.signUpWithEmail)
                }
                .padding(.bottom,24)
                Text(APP.StringLiterals.signUpDiscription)
                    .multilineTextAlignment(.center)
                    .font(getFont(.interMedium,size: 12))
                    .foregroundColor(APP.Colors.grayFont)
                    .padding(.bottom,38)
                    
                
                
                
                
            }
            
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        }.navigationBarBackButtonHidden(true)
    }

}

struct SignUpController_Previews: PreviewProvider {
    static var previews: some View {
        SignUpController()
    }
}
