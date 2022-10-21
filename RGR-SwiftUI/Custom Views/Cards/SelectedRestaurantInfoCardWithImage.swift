//
//  SelectedRestaurantInfoCard.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/20/22.
//

import SwiftUI

struct SelectedRestaurantInfoCardWithImage: View {
    
    // Max Height
    let maxHeight = UIScreen.main.bounds.height / 3.3
    
    //    var topEdge: CGFloat
    
    // Offset
    @State var offset: CGFloat = 0
    
    var restaurantName: String = "Batard"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                // Top Nav View
                GeometryReader { proxy in
                    
                    TopBar(topEdge: proxy.safeAreaInsets.top, offset: $offset)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: (maxHeight + offset) < 0 ? maxHeight : maxHeight + offset,
                               alignment: .bottom)
                        .background(
                            Color("TopBar"))
                    
                }
                .frame(height: maxHeight)
                .offset(y: -offset)
                
                
                // TODO: Add scrollable list
                InformationView(restaurantName: restaurantName)
            }
            .background(Color.gray)
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SingleRestaurantView()
    }
}

struct TopBar: View {
    
    var topEdge: CGFloat
    
    let maxHeight = UIScreen.main.bounds.height / 3.3
    @Binding var offset: CGFloat
    
    var body: some View {
        Image("StockRestaurant")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: UIScreen.main.bounds.width,
                height: (maxHeight + offset) < 0 ? maxHeight : maxHeight + offset
            )
            .edgesIgnoringSafeArea(.all)
        
    }
}

// Getting scrollview offset
struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                },
                alignment: .top
            )
    }
}

struct InformationView: View {
    
    var restaurantName: String = "Nothing passed"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 30, height: 10)
                    .padding(.top)
                
                // Name of restaurant
                HStack {
                    Text(restaurantName)
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
                
                // Type of cuisine
                HStack {
                    Text("Contemporary")
                        .italic()
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding(.leading)
                    Spacer()
                }
                
                Text("James Beard Foundation BEST NEW RESTAURANT 2015 - Drew Nieporent’s long commitment to Tribeca continues in the space that housed the legendary Montrachet with Michelin-starred dining at Bâtard.\n\n Bâtard offers a relaxed setting warmed by golden light and cozy banquettes. Outdoor tables on West Broadway are available upon request. The wine list highlights the best of Burgundy; cocktails are expertly crafted.\n\n For large party reservations (6+), please call the restaurant directly at 212-219-2777.")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .padding(.top, 1)
                    .padding(.horizontal)
            }
            .background(Color.white)
        }
    }
}

struct SelectedRestaurantInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRestaurantInfoCardWithImage()
    }
}

