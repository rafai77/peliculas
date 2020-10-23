//
//  Peliculas.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import Foundation

struct Peliculas: Identifiable {
      var id: Int
      var total_results : Int = 0
      var total_page : Int = 0
      var dataMovies = [DestailsMovie]()
     
    
    
}
