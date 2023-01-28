//
//  CharacterResultService.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import Foundation

struct CharacterResultService{
    
    //Se define un enum para salvar posibles fallos al hacer uso del servicio
    enum CharacterRsultError: Error{
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    //Esta funcion hara la peticion a la API y devolvera los resultados (Se hace uso de "Async Await")
    
    func fetchCharacters() async throws -> [Character] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw CharacterRsultError.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(CharacterResult.self, from: data)
        return decodedData.results
    }
}
