//
//  ContentView.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 22/01/23.
//

import SwiftUI

struct ContentView: View {
    //Instanciamos nuestro ViewModel
    @StateObject private var characterViewModel = CharacterViewModel(service: CharacterResultService())
    
    var body: some View {
        NavigationView{
            switch characterViewModel.state{
                //Si es posible obtener datos, entonces creamos la vista de Personajes dentro de una lista
            case .success(let data):
                List(){
                        ForEach(data, id: \.id){ item in
                                VStack(alignment: .leading){
                                    AsyncImage(url: URL(string: item.image)){ image in
                                        //Otenemos la imagen de los personajes y colocamos
                                        //aplicamos modificadores para dar la forma redonda
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .frame(width: 350, height: 150)
                                            .clipShape(Circle())
                                            .overlay{
                                                    Circle().stroke(.purple, lineWidth: 3)
                                                    }
                                            .shadow(radius: 7)
                                            
                                        
                                    } placeholder: {
                                        Color.gray.opacity(20)
                                    }
                                    //Seccion del Texto
                                    VStack(alignment:.center){
                                        HStack{
                                            Text(item.name)
                                                .font(.title)
                                                .frame(maxWidth: .infinity)
                                        }
                                        HStack{
                                            Text(item.species)
                                                .font(.body)
                                                .foregroundColor(.secondary)
                                            Text("-")
                                            Text(item.gender)
                                                .font(.body)
                                                .foregroundColor(.secondary)
                                            Text("-")
                                            Text(item.status)
                                                .font(.body)
                                                .foregroundColor(.secondary)
                                        }
                                        HStack(spacing:3.0){
                                            //Referenciamos a un icono de SF Symbols
                                            Image(systemName: "globe.americas")
                                            Text(item.locationName)
                                                .font(.body)
                                        }
                                    }
                                    
                                }
                        }
                        //Se da titulo al Navigation view y comportamiento al hacer scroll
                        .navigationTitle("Character").navigationBarTitleDisplayMode(.automatic)
                    }
                //Si la vista esta cargando, desplegamos un ProgressView
            case .loading:
                ProgressView()
            default:
                //Por default, se referenciara a una vista vacia, pero podemor invocar pantallas de error, etc.
                EmptyView()
            }
        }
        .task {
            await characterViewModel.getCharacters()
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CharacterViewModel(service: CharacterResultService()))
    }
}
