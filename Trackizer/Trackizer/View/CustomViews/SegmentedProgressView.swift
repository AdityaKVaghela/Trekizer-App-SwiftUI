//
//  SegmentedProgressView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 08/02/23.
//

import SwiftUI

enum Strength : String {
    case lower = "(Password must contain 1 Lowercase)"
    case uper = "(Password must contain 1 Upercase)"
    case number = "(Password must contain 1 Number)"
    case special = "(Password must contain 1 Special Character)"
    case length = "(Password must be greater than or equal to 8 character)"
}


struct SegmentedProgressView: View {
    var value: Int = 0
    var maximum: Int = 5
    var height: CGFloat = 5
    var spacing: CGFloat = 4
    var selectedColor: [Color] = [.red,.yellow,.purple,.cyan,.green]
    var unselectedColor: Color = APP.Colors.grayFont
    @State var arrStrength : [Strength] = []
    @State var arrMessages : [String] = []
    @Binding var password : String
    @Binding var isValidate : Bool
    
    
    var body: some View {
        VStack{
            CustomTextField(names: APP.StringLiterals.password, values:$password)
                .onChange(of: password) { newValue in
                    self.checkPasswordStrength()
                }
                .padding(.bottom,24)
            
            
            HStack(spacing: spacing) {
                ForEach(0 ..< maximum) { index in
                    Rectangle()
                        .fill(index < self.arrStrength.count ? self.selectedColor[self.arrStrength.count - 1] : self.unselectedColor)
                }
//                .animation(.linear(duration: 0.7))
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: height)
            .clipShape(Capsule())
            VStack(alignment: .leading) {
                ForEach(0..<arrMessages.count,id: \.self) { index in
                    Text(arrMessages[index])
                        .font(getFont(.interRegular,size: 12))
                        .foregroundColor(APP.Colors.grayFont)
                }
                
            }
            
            
        }
        
    }
    func checkPasswordStrength() {
        
        
        let passRegEx = ".*[A-Z].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        if passwordTest.evaluate(with: password) {
            let uperCase = arrStrength.filter { $0 == .uper }
            if uperCase.count == 0 {
                arrStrength.append(.uper)
                if let index = arrMessages.firstIndex(of: Strength.uper.rawValue) {
                    arrMessages.remove(at: index)
                }
            }
        } else {
            let uperCase = arrStrength.filter { $0 == .uper }
            if uperCase.count > 0 {
                if let index = arrStrength.firstIndex(of: uperCase[0]) {
                    arrStrength.remove(at: index)
                }
            }
            let uperCaseMsg = arrMessages.filter { $0 == Strength.uper.rawValue }
            if uperCaseMsg.count == 0 {
                arrMessages.append(Strength.uper.rawValue)
            }
        }
        
        let specialRegEx = ".*[@#$%+_!&*].*"
        let specialTest = NSPredicate(format: "SELF MATCHES %@", specialRegEx)
        if specialTest.evaluate(with: password) {
            let specialChar = arrStrength.filter { $0 == .special }
            if specialChar.count == 0 {
                arrStrength.append(.special)
                if let index = arrMessages.firstIndex(of: Strength.special.rawValue) {
                    arrMessages.remove(at: index)
                }
            }
        } else {
            let specialChar = arrStrength.filter { $0 == .special }
            if specialChar.count > 0 {
                if let index = arrStrength.firstIndex(of: specialChar[0]) {
                    arrStrength.remove(at: index)
                    
                }
            }
            let specialCharMsg = arrMessages.filter { $0 == Strength.special.rawValue }
            if specialCharMsg.count == 0 {
                arrMessages.append(Strength.special.rawValue)
            }
            
        }
        
        let numberRegEx = ".*[0-9].*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        if numberTest.evaluate(with: password) {
            let number = arrStrength.filter { $0 == .number }
            if number.count == 0 {
                arrStrength.append(.number)
                if let index = arrMessages.firstIndex(of: Strength.number.rawValue) {
                    arrMessages.remove(at: index)
                }
            }
        } else {
            let number = arrStrength.filter { $0 == .number }
            if number.count > 0 {
                if let index = arrStrength.firstIndex(of: number[0]) {
                    arrStrength.remove(at: index)
                    
                }
            }
            let numberMsg = arrMessages.filter { $0 == Strength.number.rawValue }
            if numberMsg.count == 0 {
                arrMessages.append(Strength.number.rawValue)
            }
            
        }
        
        let lowerRegEx = ".*[a-z].*"
        let lowerTest = NSPredicate(format: "SELF MATCHES %@", lowerRegEx)
        if lowerTest.evaluate(with: password) {
            let lowerCase = arrStrength.filter { $0 == .lower }
            if lowerCase.count == 0 {
                arrStrength.append(.lower)
                if let index = arrMessages.firstIndex(of: Strength.lower.rawValue) {
                    arrMessages.remove(at: index)
                }
            }
        } else {
            let lowerCase = arrStrength.filter { $0 == .lower }
            if lowerCase.count > 0 {
                if let index = arrStrength.firstIndex(of: lowerCase[0]) {
                    arrStrength.remove(at: index)
                    
                }
            }
            let lowerCaseMsg = arrMessages.filter { $0 == Strength.lower.rawValue }
            if lowerCaseMsg.count == 0 {
                arrMessages.append(Strength.lower.rawValue)
            }
            
        }
        
        if password.count > 7 {
            let length = arrStrength.filter { $0 == .length }
            if length.count == 0 {
                arrStrength.append(.length)
                if let index = arrMessages.firstIndex(of: Strength.length.rawValue) {
                    arrMessages.remove(at: index)
                }
            }
        } else {
            let length = arrStrength.filter { $0 == .length }
            if length.count > 0 {
                if let index = arrStrength.firstIndex(of: length[0]) {
                    arrStrength.remove(at: index)
                    
                }
            }
            let lengthMsg = arrMessages.filter { $0 == Strength.length.rawValue }
            if lengthMsg.count == 0 {
                arrMessages.append(Strength.length.rawValue)
            }
            
        }
        
        if arrStrength.count == 5 {
            self.isValidate = true
        } else {
            self.isValidate = false
        }
    }
    
    
    
}

struct SegmentedProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedProgressView( password: .constant("Addrr"), isValidate: .constant(false))
    }
}
