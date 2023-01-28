//
//  CharacterResult.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import Foundation

struct CharacterResult: Decodable {
    let results: [Character]
}

struct Character : Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let episode: [String]
    let locationName: String
    let locationURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
        case episode
        case location
        case locationURL = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Character.CodingKeys> = try decoder.container(keyedBy: Character.CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: Character.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Character.CodingKeys.name)
        self.status = try container.decode(String.self, forKey: Character.CodingKeys.status)
        self.species = try container.decode(String.self, forKey: Character.CodingKeys.species)
        self.gender = try container.decode(String.self, forKey: Character.CodingKeys.gender)
        self.image = try container.decode(String.self, forKey: Character.CodingKeys.image)
        self.episode = try container.decode([String].self, forKey: Character.CodingKeys.episode)
        //Se define contenedor aparte para guardar la info de Location
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.locationName = try locationContainer.decode(String.self, forKey: Character.CodingKeys.name)
        self.locationURL = try locationContainer.decode(String.self, forKey: Character.CodingKeys.locationURL)
        
    }
}
