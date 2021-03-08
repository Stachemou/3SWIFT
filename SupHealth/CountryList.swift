//
//  CountryList.swift
//  SupHealth
//
//  Created by Guillaume Hulloux on 08/03/2021.
//

import SwiftUI

struct CountryList: View {
    @ObservedObject var ApiCovid = Api()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(ApiCovid.countries) { country in
                    NavigationLink(destination: DetailsCountry(country: country)){
                        Text("\(country.Country)")
                    }
                }
            }
            .navigationTitle(Text("Countries"))
        }
    }
}

struct DetailsCountry: View {
    var country: Country
    var body: some View{
        VStack(alignment: .leading){
            Text("Covid-19 Details")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            Text("New Confirmed:\t\(country.NewConfirmed)")
            Text("Total Confirmed:\t\(country.TotalConfirmed)")
            Text("New Deaths:\t\t\(country.NewDeaths)")
            Text("Total Deaths:\t\t\(country.TotalDeaths)")
            Text("New Recovered:\t\(country.NewRecovered)")
            Text("Total Recovered:\t\(country.TotalRecovered)")
        }
        .navigationTitle(Text("\(country.Country)"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
