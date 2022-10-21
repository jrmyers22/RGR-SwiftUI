//
//  SingleRestaurantView.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/19/22.
//

import SwiftUI

struct SingleRestaurantView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showWebView = false
    
    var body: some View {
        ZStack {
            SelectedRestaurantInfoCardWithImage()
            
            
            BottomButton()
                .onTapGesture {
                    print("Open the reservation site in a webview")
                    showWebView = true
                }
            
            XButtonView()
                .position(x: 35, y: 20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: "https://www.google.com")!)
        }
        
    }
}

struct SingleRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRestaurantView()
    }
}
