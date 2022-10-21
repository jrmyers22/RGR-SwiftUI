//
//  FloatingFilterCard.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/17/22.
//

import SwiftUI

struct FloatingFilterCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.gray, lineWidth: 1)
                .frame(width: 210, height: 40)
                .overlay(Color("ReddishColor").cornerRadius(5))
            HStack(spacing: 5) {
                Text("👥 3")
                    .frame(width: 40)
                Text("•")
                Text("Fri Oct 14")
                    .frame(width: 75)
                Text("•")
                Text("Prime")
                    .frame(width: 50)
            }.foregroundColor(.white)
        }
    }
}

struct FloatingFilterCard_Previews: PreviewProvider {
    static var previews: some View {
        FloatingFilterCard()
    }
}
