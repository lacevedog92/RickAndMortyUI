//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Luis Ezcurdia on 02/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack {
                Image(systemName: "circle")
                    .font(.system(size: 72, weight: .light))
                Image(systemName: "bus")
                    .font(.system(size: 40))
            }.foregroundColor(.blue)
            Text("Hello SwiftUI")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
