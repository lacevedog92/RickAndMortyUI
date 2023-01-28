//
//  Episode.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import Foundation

struct Episode : Decodable {
    let id : Int
    let name : String
    let air_date : String
    let episode : String
}
