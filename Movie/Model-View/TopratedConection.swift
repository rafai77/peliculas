//
//  TopratedConection.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import Foundation

import SwiftUI
import Combine
import Alamofire
import SwiftyJSON



class TopratedConection: ObservableObject {
    
    @Published var movieList = [Peliculas]()
    @Published var movieList2 = [DestailsMovie]()
    static var page=1
    
    init()
    {
        DispatchQueue.main.async {
            AF.request(EndPoint.Top+"1").responseJSON { (response) in
                switch response.result
                {
                case .success(let data):
                    let json = JSON(data)
                    var auxdatadetails = [DestailsMovie]()
                    for i in json["results"]
                    {
                    let movie = DestailsMovie(id: i.1["id"].int ?? 0, poster: i.1["poster_path"].string ?? "0", adult: i.1["adult"].string ?? "0", overview: i.1["overview"].string ?? "0", date: i.1["release_date"].string ?? "0", genre_ids: [0,0,0], title: i.1["title"].string ?? "0", original_title: i.1["original_title"].string ?? "0", backdrop_path: i.1["backdrop_path"].string ?? "0", popularity: i.1["popularity"].double ?? 0.0, video: i.1["video"].bool ?? false, vote_average: i.1["vote_average"].double ?? 0.0)
                        auxdatadetails.append(movie)
                    }
                    
                    //print(auxdatadetails)
                    
                    var aux = Peliculas(id: 1 , total_results: json["total_results"].int ?? 0 , total_page: json["total_results"].int ?? 0 , dataMovies: auxdatadetails)
                    self.movieList.append(aux)
                    self.movieList2.append(contentsOf: auxdatadetails)

                case .failure(let error):
                    print(error)

                }
            }
        }
    }
    
public func nextpage(page :Int)
    {
            print(EndPoint.Top+"(\(page)")
            AF.request(EndPoint.Top+"(\(page)").responseJSON { (response) in
                switch response.result
                {
                case .success(let data):
                    let json = JSON(data)
                    var auxdatadetails = [DestailsMovie]()
                    for i in json["results"]
                    {
                    let movie = DestailsMovie(id: i.1["id"].int ?? 0, poster: i.1["poster_path"].string ?? "0", adult: i.1["adult"].string ?? "0", overview: i.1["overview"].string ?? "0", date: i.1["release_date"].string ?? "0", genre_ids: [0,0,0], title: i.1["title"].string ?? "0", original_title: i.1["original_title"].string ?? "0", backdrop_path: i.1["backdrop_path"].string ?? "0", popularity: i.1["popularity"].double ?? 0.0, video: i.1["video"].bool ?? false, vote_average: i.1["vote_average"].double ?? 0.0)
                        auxdatadetails.append(movie)
                    }
                    
                    
                    self.movieList2.append(contentsOf: auxdatadetails)

                case .failure(let error):
                    print(error)

                }
            
        }
        
    }
}
