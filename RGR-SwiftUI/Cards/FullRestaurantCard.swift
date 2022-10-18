//
//  FullRestaurantCard.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/17/22.
//

import SwiftUI

struct FullRestaurantCard: View {
    var imageName = "stmarylake"
    var textStr = "Content"
    
    var body: some View {
        Button(action: {
            print("Selected a restaurant card")
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 8.0)
                    .strokeBorder(Color.gray, lineWidth: 1)
                .frame(width: 175, height: 190)
                
                Image("StockRestaurant")
                    .resizable()
                    .frame(width: 175, height: 190, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .foregroundColor(Color.black)
                            .opacity(0.55)
                    )
                
                VStack {
                    TransparentTextBox()
                    SmallRestaurantThumbnailCard()
                        .padding(.bottom, -10)
                }

            }
        }
    }
}

struct FullRestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        FullRestaurantCard()
    }
}

struct TransparentTextBox: View {
    var textStr = "Bâtard"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .strokeBorder(Color.gray, lineWidth: 0)
            .frame(width: 175, height: 85)
            
            
            Text(textStr)
                .padding(.horizontal, 5)
                .frame(width: 175, height: 70)
                .font(.title3)
                .fontWeight(.heavy)
                .kerning(2)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .bold()
                .lineLimit(nil)
        }
    }
}
