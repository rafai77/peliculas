//
//  DetailsMovie.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import Foundation

struct DestailsMovie: Identifiable {
    var id: Int
    var poster : String
    var adult : String
    var overview : String
    var date : String
    var genre_ids : [Int]
    var title : String
    var original_title : String
    var backdrop_path : String
    var popularity : Double
    var video : Bool
    var vote_average : Double
    var name : String
    var original_name: String
    var lenguaje:String
}
