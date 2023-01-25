//
//  BindingView.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var colorsOn = [Color.red, Color.yellow]
    var colorsOff = [Color(white: 0.4), Color(white: 0.6)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? colorsOn : colorsOff, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct BindingView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
