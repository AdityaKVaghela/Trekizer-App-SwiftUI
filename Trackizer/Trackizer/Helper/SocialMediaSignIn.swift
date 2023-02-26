//
//  SocialMediaSignIn.swift
//  Fitness
//
//  Created by Sneh on 20/01/23.
//

import Foundation
import GoogleSignIn
import Firebase
import AuthenticationServices
import CryptoKit

class SocialMediaSignIn: NSObject,ASAuthorizationControllerDelegate {
    
    static let shared = SocialMediaSignIn()
    var didAppleSignInBlock : ((_ success:Bool, _ err:String) -> Void)!
    private var currentNonce: String?
    
    func signInWithGoogle(completionHandler: @escaping ((_ success:Bool, _ err:String) -> Void)) {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [self] user, error in
                if let user = user {
//                    self.checkGoogleUserInFirebase(user:user){
//                        success,error in
                    print(user.profile?.name)
                    print(user.profile?.familyName)
                    print(user.profile?.email)
                    print(user.profile?.description)
                    
                    self.loginGoogleUserInFirebase(user: user) { success, err in
                        completionHandler(success,error?.localizedDescription ?? "")
                    }
//                    }
                }
            }
        } else {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            let configuration = GIDConfiguration(clientID: clientID)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            GIDSignIn.sharedInstance.configuration = configuration
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
                if let user = result?.user {
//                    self.checkGoogleUserInFirebase(user:user) {
//                        success,error in
                    self.loginGoogleUserInFirebase(user: user) { success, err in
                        completionHandler(success,error?.localizedDescription ?? "")
                    }
                       
//                    }
                }
            }
        }
    }
    
    
    
    private func loginGoogleUserInFirebase(user:GIDGoogleUser,completionHandler: @escaping ((_ success:Bool,_ err:String) -> Void)) {
        guard let idToken = user.idToken?.tokenString else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        
        FirebaseAuth.Auth.auth().signIn(with: credential) { (_, error) in
            if error != nil {
                completionHandler(false, error?.localizedDescription ?? " An error occurred")
            } else {
                completionHandler(true,"")
            }
        }
    }
    
    func signInWithApple() {
        let nonce = randomNonceString()
        self.currentNonce = nonce
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length

        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }

            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }

                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }

        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
//    func authorizationController(controller: ASAuthorizationController,
//                                 didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
//            let userIdentifier = appleIDCredential.user
//            let appleIDProvider = ASAuthorizationAppleIDProvider()
//            appleIDProvider.getCredentialState(forUserID: userIdentifier) {  (credentialState, error) in
//                switch credentialState {
//                case .authorized:
//                    if self.didAppleSignInBlock != nil {
//                        guard let appleIDToken = appleIDCredential.identityToken else { return }
//                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return }
//                        let credential = OAuthProvider.credential(withProviderID: "apple.com",
//                                                                  idToken: idTokenString,
//                                                                  rawNonce: self.currentNonce)
//                        let storedCredential = UserDefaults.standard.value(forKey: "AppleIdCredential") as? [String]
//                        if storedCredential == nil {
//                            UserDefaults.standard.set([appleIDCredential.email,appleIDCredential.fullName?.givenName], forKey: "AppleIdCredential")
//                        }
//                        self.checkAppleUserInFirebase(email: (storedCredential?[0] ?? appleIDCredential.email), fullname: (storedCredential?[1] ?? appleIDCredential.fullName?.givenName), firebaseCredential: credential)
//                    }
//                    break
//                case .revoked:
//                    if self.didAppleSignInBlock != nil {
//                        self.didAppleSignInBlock(false, error?.localizedDescription ?? "This apple id is revoked")
//                    }
//                    break
//                case .notFound:
//                    if self.didAppleSignInBlock != nil {
//                        self.didAppleSignInBlock(false, error?.localizedDescription ?? "Apple id not found")
//                    }
//                    break
//                default:
//                    break
//                }
//            }
//
//        }
//    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("ERROR:",error.localizedDescription)
    }
    
//    func checkAppleUserInFirebase(email: String?,fullname: String?,firebaseCredential: AuthCredential) {
//        if let email = email {
//            DatabaseManager.shared.userExists(with: email) { isExists in
//                guard !isExists else {
//                    self.loginAppleUserInFirebase(firebaseCredential:firebaseCredential)
//                    return
//                }
//                self.loginAppleUserInFirebase(firebaseCredential:firebaseCredential)
//                DatabaseManager.shared.insertUser(user: UserModel(firstName: fullname ?? "", lastName: "", email: email,phone: ""))
//            }
//        }
//    }
    
    func loginAppleUserInFirebase(firebaseCredential:AuthCredential) {
        FirebaseAuth.Auth.auth().signIn(with: firebaseCredential) { (_, error) in
            if error != nil {
                self.didAppleSignInBlock(false,error?.localizedDescription ?? "An error occurred")
            } else {
                self.didAppleSignInBlock(true,"")
            }
        }
    }
}
