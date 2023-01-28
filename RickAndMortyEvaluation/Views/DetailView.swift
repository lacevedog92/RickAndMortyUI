//
//  DetailView.swift
//  RickAndMortyEvaluation
//
//  Created by Luis Acevedo on 25/01/23.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var detailCharacter : CharacterViewModel
    
    var body: some View {
        NavigationView{
            switch detailCharacter.state{
            case .success(let detailData):
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                ForEach(detailData,id: \.id){ itemDetail in
                    Text(itemDetail.name)
                        .font(.title2)
                }
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
            
        }
        .task {
            await detailCharacter.getCharacters()
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView().environmentObject(CharacterViewModel(service: CharacterResultService()))
    }
}
