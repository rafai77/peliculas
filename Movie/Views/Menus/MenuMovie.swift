//
//  MenuMovie.swift
//  Movie
//
//  Created by Rafael Aguirre  on 20/10/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct MenuMovie: View {
    @State private var pos = 0// poscion del menu 0 para toprate 1 par populares
    var body: some View {
        VStack
        {
            
            
            Picker(selection: self.$pos , label:Text("hola" ) ) {
                
                
                
                Image(systemName: "hand.thumbsup.fill").tag(0)
                Image(systemName: "flame.fill").tag(1)
                
            }.pickerStyle(SegmentedPickerStyle())
            if self.pos == 1
            {
                Text("Peliculas pulares")
                ListvView(req: EndPoint.Popular)
            } // aqi va el mnu para series de tv }
            
            if self.pos == 0
            {
                Text("Peliculas Toprated")
                ListvView(req: EndPoint.Top)
            } // aqi va el mnu para peliculaas de tv }
            
        }
    }
}

@available(iOS 14.0, *)
struct MenuMovie_Previews: PreviewProvider {
    static var previews: some View {
        MenuMovie()
    }
}
