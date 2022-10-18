//
//  ContentView.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .red
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: [GridItem(), GridItem()],
                        spacing: 15
                    ) {
                        ForEach(0..<15) { _ in
                            FullRestaurantCard()
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .padding(8)
                }
                .background(Color("BackgroundColor"))
                
                .toolbar {
                    Button(action: {
                        print("Take them to a profile or something")
                    }) {
                        ZStack {
                            Image("guy")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                        }
                    }
                }
                .navigationBarTitle("Hello, Jacob", displayMode: .inline)
                .toolbarBackground(Color("ReddishColor"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                
                VStack {
                    Spacer()
                    // TODO: Fix Bug
                    FloatingFilterCard()
                }
            }
        }
    }
    
    // TODO: Use this to filter the grid items
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return names
//        } else {
//            return names.filter { $0.contains(searchText) }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
