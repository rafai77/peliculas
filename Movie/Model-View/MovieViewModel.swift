//
//  MovieViewModel.swift
//  Movie
//
//  Created by Rafael Aguirre  on 22/10/20.
//

import Foundation

import SwiftUI
import Combine
import Alamofire
import SwiftyJSON






class MovieViewModel: ObservableObject {
    var error : String =  " No se pudieron obtener las pelicuas"
    @Published var movieList = Peliculas()
    @Published var movieList2 = [DestailsMovie]()
    static var page = 1
    var req: String = " "
    
    init(request :String)
    {
        self.req = request
        //print(self.req)
        self.data(search: self.req) { (dat,details) in
            //print(details)
            self.movieList = details
            self.movieList2 = details.dataMovies
            //a bd
        }
    

        
    }
   
    
    
    public func data (search: String  ,pages: Int = 1,completion:@escaping (_ rest:Int ,_ movie :Peliculas    )->Void)
    {
        var auxdatadetails = [DestailsMovie]()
       var movie = Peliculas()
        DispatchQueue.main.async {
            AF.request(search+"\(pages)").responseJSON   { (response) in
                var result = -1
                switch response.result
                {
                case .success(let data):
                    
                    let json = JSON(data)
                    //print(json)
                    for i in json["results"]
                    {
                        let movie = DestailsMovie(id: i.1["id"].int ?? 0, poster: i.1["poster_path"].string ?? "0", adult: i.1["adult"].string ?? "0", overview: i.1["overview"].string ?? "0", date: i.1["release_date"].string ?? "0", genre_ids: [0,0,0], title: i.1["title"].string ?? "0", original_title: i.1["original_title"].string ?? "0", backdrop_path: i.1["backdrop_path"].string ?? "0", popularity: i.1["popularity"].double ?? 0.0, video: i.1["video"].bool ?? false, vote_average: i.1["vote_average"].double ?? 0.0, name: i.1["name"].string ?? "0", original_name: i.1["original_name"].string ?? "0",lenguaje: i.1["original_language"].string ?? "0")
                        auxdatadetails.append(movie)
                    }
                    let aux = Peliculas(id: 1 , total_results: json["total_results"].int ?? 0 , total_page: json["total_results"].int ?? 0 , dataMovies: auxdatadetails)
                    //self.movieList = aux
                    
                    movie = aux
                    result = auxdatadetails.count
                    
                    
                case .failure(let error):
                    result = -1
                    print(error)
                    
                }
                completion(result,movie)
            }
            
        }

        
        
    }
    

    
    public func Search(search :String,page : Int)
    {
        
        self.data(search: search) { (dat,details) in
            self.movieList2 = details.dataMovies
        }
        
    }
    
    public func nextpage(page :Int)
    {
       
        self.data(search: self.req,pages: page) { (dat,details) in
            self.movieList2.append(contentsOf: details.dataMovies  )
        }
    }
}
