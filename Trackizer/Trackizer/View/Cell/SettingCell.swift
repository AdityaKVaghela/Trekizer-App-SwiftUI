//
//  SettingCell.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 21/02/23.
//

import SwiftUI

struct SettingCell: View {
    var model =   SettingModel(icon:APP.Images.faceID , title: APP.StringLiterals.security, currentVal: "FaceID")
    var body: some View {
        HStack{
            HStack(spacing: 20){
                model.icon.frame(width: 20,height: 20)
                Text(model.title).font(getFont(.interSemiBold,size: 14)).foregroundColor(.white)
            }
            Spacer()
            HStack(spacing: 8){
                Text(model.currentVal).font(getFont(.interMedium,size: 12)).foregroundColor(APP.Colors.grayFont)
                APP.Images.vector
            }
           
            
        }
    }
}

struct SettingCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingCell()
    }
}
