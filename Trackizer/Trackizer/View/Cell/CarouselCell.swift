//
//  CarouselCell.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 16/02/23.
//

import SwiftUI

struct CarouselCell: View {
    var carouselImage = APP.Images.hbo
    var body: some View {
        carouselImage
            .resizable()
            .frame(width: 160,height: 160)
            .scaledToFit()
    }
}

struct CarouselCell_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCell()
    }
}
