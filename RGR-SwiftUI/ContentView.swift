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
    
    let names = ["Ai Fiori",
                 "Bâtard",
                 "Contra",
                 "Crown Shy",
                 "Eleven Madison Park",
                 "Jungsik",
                 "Kanoyama",
                 "Kochi",
                 "Kosaka",
                 "L'Appart",
                 "Le Bernardin",
                 "Le Coucou",
                 "Per Se",
                 "Sushi Ginza Onodera",
                 "Sushi Noz"]
    
    @State private var searchText = ""
    @State private var showSingleRestaurantView = false
    @State private var showFilterCriteria = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Filter TBD...")
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(
                            columns: [GridItem(), GridItem()],
                            spacing: 15
                        ) {
                            ForEach(0..<15) { i in
                                FullRestaurantCard(restName: names[i])
                                    .onTapGesture {
                                        showSingleRestaurantView = true
                                    }
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
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        print("Show filter")
                        showFilterCriteria = true
                    }) {
                        FloatingFilterCard()
                    }
                    .sheet(isPresented: $showFilterCriteria) {
                        FilterSheetCard(showFilterCriteria: $showFilterCriteria)
                            .presentationDetents([.fraction(0.55)])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }.fullScreenCover(isPresented: $showSingleRestaurantView) {
            SingleRestaurantView()
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
