//
//  BottomButton.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/20/22.
//

import SwiftUI

struct BottomButton: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 310, height: 50)
                    .overlay(Color("ReddishColor").cornerRadius(10))
                
                Text("Book on OpenTable →")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.bottom)
            .shadow(radius: 8)
        }
    }
}

struct BottomButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomButton()
    }
}
