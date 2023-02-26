//
//  CustomButton.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 07/02/23.
//

import SwiftUI

struct CustomButton: View {
    @State var color = APP.Colors.orangeColor
    @State var title = "Get Started"
    @State var isImage = false
    @State var Image = APP.Images.google
    @State var fontColor = Color.white
    @State var widthToMinus = 50.0
    
    let colors = [
    APP.Colors.radial,
        APP.Colors.orangeColor,
       
     ]
       
       

    var body: some View {
        HStack {
            if isImage{
                Image
            }
            
            Text(title)
                .font(getFont(.interSemiBold ,size:  14))
                .foregroundColor(fontColor)
                
        }
        .frame(width: UIScreen.main.bounds.width - widthToMinus,height: 48)
        .background(color)
        .cornerRadius(100)
        .shadow(color: color, radius: 3)
         
    }
    
    func getGradiant() -> RadialGradient {
        RadialGradient(gradient: Gradient(colors: colors),
                       center: .center, startRadius: 0, endRadius: 10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
