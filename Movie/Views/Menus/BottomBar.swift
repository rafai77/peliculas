//
//  BottomBar.swift
//  Movie
//
//  Created by Rafael Aguirre  on 20/10/20.
//

import SwiftUI

@available(iOS 14.0, *)
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
            if self.pos == 2
            {
                if #available(iOS 14.0, *) {
                    Search()
                } else {
                    // Fallback on earlier versions
                }
            } // aqi va el mnu para peliculaas de tv }
            Spacer()
            Picker(selection: self.$pos , label:Text("hola" ) ) {
                
                
               
                Image(systemName: "tv.fill").tag(0)
                Image(systemName: "film.fill").tag(1)
                Image(systemName: "magnifyingglass.circle.fill").tag(2)
                
            }.pickerStyle(SegmentedPickerStyle())
            
           
        }
        
    }
    
}

@available(iOS 14.0, *)
struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
