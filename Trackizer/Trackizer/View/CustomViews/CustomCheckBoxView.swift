//
//  CustomCheckBoxView.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 08/02/23.
//

import SwiftUI

import SwiftUI

struct CustomCheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(APP.Colors.grayFont)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CustomCheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CustomCheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
