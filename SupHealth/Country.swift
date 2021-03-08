//
//  Data.swift
//  SupHealth
//
//  Created by Guillaume Hulloux on 08/03/2021.
//

import SwiftUI

struct Country: Codable, Identifiable, Hashable{
    var id:String {
        get { return self.ID}
        set(value) { self.ID = value }
    }
    var ID: String
    var Country: String
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
}

struct Global: Codable{
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
}

struct Base: Codable {
    var Global: Global
    var Countries: [Country]
}


class Api: ObservableObject {
    init() {
        getCountries()
    }
    @Published var countries: [Country] = []
    
    func getCountries() {
        guard let url = URL(string: "https://api.covid19api.com/summary") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            if let data = data {
                let base = try! JSONDecoder().decode(Base.self, from: data)
                                
                DispatchQueue.main.async {
                    self.countries = base.Countries
                    print(self.countries)
                }
            }
        }
        .resume()
    }
}
