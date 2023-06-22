//
//  FlightBoardView.swift
//  Airport
//
//  Created by Dmitriy Panferov on 22/06/23.
//

import SwiftUI

struct FlightBoardView: View {
    @State private var hiddenCanceled = false
    
    let boardName: String
    let flightInfo: [FlightInformation]
    
    private var shownFlights: [FlightInformation] {
        hiddenCanceled
            ? flightInfo.filter { $0.status != .cancelled }
            : flightInfo
    }
    
    var body: some View {
        List(flightInfo) { flight in
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Toggle("Hide canceled", isOn: $hiddenCanceled)
            }
        }
    }
}

struct FlightBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightBoardView(boardName: "Flight Board", flightInfo: FlightInformation.generateFlights())
    }
}
