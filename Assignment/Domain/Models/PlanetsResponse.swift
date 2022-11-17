//
//  PlanerListResponse.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

struct PlanetsResponse: Codable {
    var results: [Planets]?

    enum CodingKeys: String, CodingKey {
       case results = "results"
    }
}

struct Planets: Codable {
   
    var name: String?
    var orbitalPeriod: String?
    var climate: String?
    var gravity: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case orbitalPeriod = "orbital_period"
        case climate = "climate"
        case gravity = "gravity"
    }
}
