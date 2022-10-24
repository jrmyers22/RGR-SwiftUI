//
//  FilterSheetCard.swift
//  RGR-SwiftUI
//
//  Created by Jacob Myers on 10/24/22.
//

import SwiftUI

enum PartySize: String, CaseIterable, Identifiable {
    case one, two, three, four, five, six, seven, eight, nine, ten
    var id: Self { self }
}


struct FilterSheetCard: View {
    @State private var pickerSelection: PartySize = .one
    @Binding var showFilterCriteria: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Party Size")
            Picker("Select", selection: $pickerSelection) {
                Text("1").tag(PartySize.one)
                Text("2").tag(PartySize.two)
                Text("3").tag(PartySize.three)
                Text("4").tag(PartySize.four)
                Text("5").tag(PartySize.five)
                Text("6").tag(PartySize.six)
                Text("7").tag(PartySize.seven)
                Text("8").tag(PartySize.eight)
                Text("9").tag(PartySize.nine)
                Text("10").tag(PartySize.ten)
            }
            .padding(.horizontal)
            .pickerStyle(.segmented)
            
            DatePickerExample()
            
            Button(action: {
                showFilterCriteria = false
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 310, height: 50)
                        .overlay(Color("ReddishColor").cornerRadius(10))
                    
                    Text("Search →")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.bottom)
                .shadow(radius: 8)
            }
        }
    }
}

struct FilterSheetCard_Previews: PreviewProvider {
    static var previews: some View {
        FilterSheetCard(showFilterCriteria: .constant(.random()))
    }
}

struct DatePickerExample: View {
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 12, day: 15)
        let endComponents = DateComponents(year: 2021, month: 12, day: 30, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date, .hourAndMinute])
        .padding()
        .datePickerStyle(.wheel)
    }
}
