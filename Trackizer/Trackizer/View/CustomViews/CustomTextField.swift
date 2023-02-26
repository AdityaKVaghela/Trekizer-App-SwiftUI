//
//  CustomTextField.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 07/02/23.
//

import SwiftUI

struct CustomTextField: View {
    @State var names = " address"
    @Binding var values : String
    var body: some View {
        VStack(alignment: .leading) {
            Text(names)
                .foregroundColor(APP.Colors.grayFont)
                .font(getFont(.interMedium,size: 12))
            HStack{
                TextField("", text: $values)
                    .font(getFont(.interMedium,size: 12))
                    .foregroundColor(APP.Colors.grayFont)
                    .frame(width: UIScreen.main.bounds.width - 50,height: 48)
                    .padding(.leading,10)
            }
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(APP.Colors.grayFont, lineWidth: 1)
            )
            
            
            
        }
        
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(values: .constant("das"))
    }
}
