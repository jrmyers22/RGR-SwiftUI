//
//  SmallRestaurantThumbnailCard.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/17/22.
//

import SwiftUI

struct SmallRestaurantThumbnailCard: View {
    var dollarSignStr: String = "$$$"
    var cuisineStr: String = "Steakhouse"
    var ratingStr: String = "4.6"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 175, height: 90)
                .overlay(Color.white.cornerRadius(8))
                .shadow(radius: 2)
            VStack {
                HStack {
                    Text(dollarSignStr)
                    Text("•")
                    Text(cuisineStr)
                    Text("•")
                    Text(ratingStr)
                }.font(.system(size: 13))
                    .foregroundColor(.black)
                HStack(spacing: 4) {
                    AvailableTimeBubble(timeStr: "6:30")
                    AvailableTimeBubble(timeStr: "7:00")
                    AvailableTimeBubble(timeStr: "7:30")
                    Text("+5")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }.font(.system(size: 13))
            }
        }
    }
}

struct SmallRestaurantThumbnailCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallRestaurantThumbnailCard()
    }
}

struct AvailableTimeBubble: View {
    var timeStr: String = "7:30"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40, height: 30)
            .overlay(Color("ReddishColor").cornerRadius(8))
            
            Text(timeStr)
                .foregroundColor(.white)
        }
    }
}
