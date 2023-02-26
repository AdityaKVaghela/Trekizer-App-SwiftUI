//
//  CustomTabBar.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 08/02/23.
//

import Foundation
import SwiftUI

enum tabItem {
    case home
    case budgets
    case calendar
    case credit
}

import SwiftUI

struct TabBar: View {
//    @State var isSelected = false
    @Binding var selectedTab : tabItem
    @Binding var goToAdd : Bool
    var iconColor = APP.Colors.appBackground
    var body: some View {
       
            ZStack{
                
                TabBarShape()
                    
                    .fill(APP.Colors.tabBack)
                    .cornerRadius(20)
                    .frame(height: 55)
//                    .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 0)
                    
                    .overlay(
                        Button(action: {
                            self.goToAdd = true
                        }, label: {
                            APP.Images.add
                                .frame(width: 48, height: 48, alignment: .center)
                                .background(APP.Colors.orangeColor)
                                .cornerRadius(24)
                        }).offset(x: 0, y: -19)
                            .shadow(color: APP.Colors.orangeColor, radius: 3)
                    )
                
                HStack(alignment: .center,spacing:  UIScreen.main.bounds.width/6) {
                    APP.Images.home.foregroundColor(selectedTab == .home ? .white : iconColor)
                        .frame(width: 18 , height: 18)
                        .onTapGesture {
                            self.selectedTab = .home
                        }
                    APP.Images.budgets.foregroundColor(selectedTab == .budgets ? .white : iconColor)
                        .frame(width: 18 , height: 18)
                        .padding(EdgeInsets(top: 0, leading:-10, bottom: 0, trailing: 50))
                        .onTapGesture {
                            self.selectedTab = .budgets
                        }
                    APP.Images.calender.foregroundColor(selectedTab == .calendar ? .white : iconColor)
                        .frame(width: 18 , height: 18)
                        .padding(EdgeInsets(top: 0, leading:0, bottom: 0, trailing: -10))
                        .onTapGesture {
                            self.selectedTab = .calendar
                        }
                    APP.Images.credit.foregroundColor(selectedTab == .credit ? .white : iconColor)
                        .frame(width: 18 , height: 18)
                        .onTapGesture {
                            self.selectedTab = .credit
                        }
                }
                
            }
            
            .padding(.horizontal,24)
        
        
        
        
    }
}

struct TabBarShape: Shape {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let buttonRadius: CGFloat = 22
        static let buttonPadding: CGFloat = 8
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        path.move(to: .init(x: 0, y: rect.height))
        path.addLine(to: .init(x: 0, y: rect.height - Constants.cornerRadius))
        path.addArc(withCenter: .init(x: Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
        
        let lineEnd = rect.width/2 - 2 * Constants.buttonPadding - Constants.buttonRadius
        path.addLine(to: .init(x: lineEnd, y: 0))
        path.addArc(withCenter: .init(x: lineEnd, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
        path.addArc(withCenter: .init(x: rect.width/2, y: Constants.buttonPadding), radius: Constants.buttonPadding + Constants.buttonRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
        
        let lineStart = rect.width/2 + 2 * Constants.buttonPadding + Constants.buttonRadius
        path.addArc(withCenter: .init(x: lineStart, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
        
        path.addLine(to: .init(x: rect.width - Constants.cornerRadius, y: 0))
        path.addArc(withCenter: .init(x: rect.width - Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
        path.addLine(to: .init(x: rect.width, y: rect.height))
        path.close()
        
        return Path(path.cgPath)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar( selectedTab: .constant(.home), goToAdd: .constant(false))
    }
}
