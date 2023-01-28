//
//  CharacterViewModel.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import Foundation
@MainActor
class CharacterViewModel: ObservableObject {
    //Posibles estados de la vista
    enum State {
        case na //Estado de inicio
        case loading //Cargando Vista
        case success(data: [Character]) //Todo OK, la vista se cargo completamente
        case failed(error: Error) //Hubo un error
    }
    //Nuestro viewmodel arracara en este estado
    @Published private(set) var state: State = .na
    //Instanciamos el servicio creado previamente
    private let service: CharacterResultService
    init(service: CharacterResultService){
        self.service = service
    }
    
    //Con la siguiente funcion obtenemos los datos (Ya no desde la API, los obtenemos desde el servicio para hacer el envio al ContentView
    func getCharacters () async {
        self.state = .loading
        do
        {
            let characters = try await service.fetchCharacters()
            self.state = .success(data: characters)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
