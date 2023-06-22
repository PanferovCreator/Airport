//
//  FlightDetailsView.swift
//  Airport
//
//  Created by Dmitriy Panferov on 22/06/23.
//

import SwiftUI

struct FlightDetailsView: View {
    @Binding var isPresented: Bool
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                Spacer()
                Button("Done") {
                    isPresented.toggle()
                }
            }
            Text("\(flight.direction == .arrival ? "From " : "To ") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundColor(Color(flight.timelineColor))
            Spacer()
        }
        .padding()
        .font(.headline)
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsView(isPresented: .constant(true),
                          flight: FlightInformation.generateFlight())
    }
}
