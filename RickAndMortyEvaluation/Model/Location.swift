//
//  Location.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import Foundation


struct Location : Decodable {
    let id: Int
    let name : String
    let type : String
    let dimension : String
}
