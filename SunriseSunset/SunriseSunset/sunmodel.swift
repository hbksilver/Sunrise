//
//  sunmodel.swift
//  SunriseSunset
//
//  Created by David on 2/17/21.
//

import Foundation

struct SunRiseModel: Decodable {
    let status: String
    let results: Results
}

struct Results: Decodable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
}
