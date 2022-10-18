//
//  DatePickerView.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/10/22.
//

import SwiftUI

struct DatePickerView: View {
    
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    var bounds: PartialRangeFrom<Date> {
        let today = Date()
        let start = calendar.date(
            from: DateComponents(
                timeZone: timeZone,
                year: 2022,
                month: 10,
                day: 10)
        )!
        
        return start...
        
    }
    
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Date")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(.leading, 20)
                    Spacer()
                }
                ZStack {
                    DatePickerWidgetView(dates: $dates, bounds: bounds)
                        .padding(.horizontal)
                }
                
            }
            .padding(.top, 25)
            
            Spacer()
            
            Button(action: {
                // Go to Date screen
                print(dates)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 342, height: 70)
                        .tint(Color("ButtonColor"))
                        .shadow(radius: 6)
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .bold()
                }
            }
        }
        .background(
            Image("StockRestaurant")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height * 1.02)
                .opacity(1.0)
        )
    }
}

struct DatePickerWidgetView: View {
    
    @Binding var dates: Set<DateComponents>
    
    var bounds: PartialRangeFrom<Date>
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
            .frame(height: UIScreen.main.bounds.height * 0.5)
        MultiDatePicker("Dates Available", selection: $dates, in: bounds)
            .frame(width: 320, height: 410)
            .tint(.red)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
