//
//  CirculerProgressBar.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 10/02/23.
//

import SwiftUI

struct CirculerProgressBar: View {
    @Binding var seeUrBudget : Bool
    @Binding var progressValue: Float
    let timer = Timer.publish(every: 0.01 , on: .main, in: .common).autoconnect()
    @State var convertedValue : Float = 0.0
    @State var animatedValue : Float = 0.0
    
    var body: some View {
        
//        VStack {
            ZStack{
                
                ProgressBar(progress: $animatedValue)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .padding(40.0)
                        .onReceive(timer) { _ in
                            withAnimation {
    //                            if let convertedValue =  self.convertedValue {
                                if animatedValue <  convertedValue {
                                    animatedValue +=  0.0275
    //                                }
                                }
                               
                            }
                        }
                VStack{
                    APP.Images.logo
                        .resizable()
                        .frame(width: 107,height: 18)
                        .padding(.bottom,24)
                        .padding(.top,70)
                    Text(APP.StringLiterals.amount)
                        .font(getFont(.interBold,size : 40))
                        .foregroundColor(.white)
                        .padding(.bottom,16)
                    Text(APP.StringLiterals.thisMonthsBill)
                        .font(getFont(.interSemiBold,size : 12))
                        .foregroundColor(APP.Colors.grayFont)
                        .padding(.bottom,29)

                    Button {
                        self.seeUrBudget = !self.seeUrBudget
                    } label: {
                        HStack {
                            Text(APP.StringLiterals.seeYourBud)
                                .font(getFont(.interSemiBold ,size:  12))
                                .foregroundColor(.white)
                                
                        }
                        .frame(width: 120,height: 32)
                        .background(APP.Colors.appGray)
                        .cornerRadius(100)
                    }

                   
                   
                }
                
                
                
            }.onAppear{
                        self.convertedValue = (self.progressValue + 0.25) * 0.8

                    }
    }
    
    struct ProgressBar: View {
        @Binding var progress: Float
        
        var body: some View {
            ZStack {
                Circle()
                    .trim(from: 0.2 , to: 4)
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(APP.Colors.appBackground)
                    .rotationEffect(.degrees(54.5))
                
                Circle()
                    .trim(from: 0.2, to: CGFloat(self.progress))
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                
                    .fill(APP.Colors.orangeColor)
                    .shadow(color: APP.Colors.orangeColor, radius: 3)
                    .rotationEffect(.degrees(54.5))
                
                VStack{
                    Text("824").font(Font.system(size: 44)).bold().foregroundColor(Color.init("314058"))
                    Text("Great Score!").bold().foregroundColor(Color.init("32E1A0"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CirculerProgressBar(seeUrBudget: .constant(false), progressValue: .constant(0.5))
    }
}

