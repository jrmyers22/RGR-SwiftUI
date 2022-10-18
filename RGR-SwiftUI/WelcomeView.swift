//
//  WelcomeView.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/10/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var goToNext = false
    
    var body: some View {
        VStack {
            Text("Welcome!")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
            Divider()

            Text("Some type of copy about what RGR is that goes all the way down")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .padding()
                .padding(.top, 40)
            
            Text("🍽")
                .foregroundColor(.white)
                .font(.system(size: 150))
                .padding()
            Spacer()
            
            Button(action: {
                // Go to Date screen
                withAnimation {
                    goToNext = true
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 342, height: 70)
                        .tint(Color("ButtonColor"))
                        .shadow(radius: 6)
                    Text("Try it")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .bold()
                }
            }
        }
        .background(Color("ReddishColor"))
        .overlay(goToNext ? DatePickerView() : nil)
//        .fullScreenCover(isPresented: $goToNext) {
//            DatePickerView()
//        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
