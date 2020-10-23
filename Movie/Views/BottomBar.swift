//
//  BottomBar.swift
//  Movie
//
//  Created by Rafael Aguirre  on 20/10/20.
//

import SwiftUI

struct BottomBar: View {
    @State private var pos = 0// poscion del menu 0 para peliculas 1 para tv series
    var body: some View {
        VStack
        {
            if self.pos == 1
            {
                
                MenuMovie()
            } // aqi va el mnu para series de tv }
            
            if self.pos == 0
            {
                MenuTv()
            } // aqi va el mnu para peliculaas de tv }
            Spacer()
            Picker(selection: self.$pos , label:Text("hola" ) ) {
                
                
               
                Image(systemName: "tv").tag(0)
                Image(systemName: "film.fill").tag(1)
                
            }.pickerStyle(SegmentedPickerStyle())
            
           
        }
        
    }
    
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
