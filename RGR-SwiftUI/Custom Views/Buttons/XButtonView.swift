//
//  XButtonView.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/20/22.
//

import SwiftUI

struct XButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45, height: 45)
                .overlay(Color.white.cornerRadius(30))

            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
        }.padding(.leading)
    }
}

struct XButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XButtonView()
    }
}
