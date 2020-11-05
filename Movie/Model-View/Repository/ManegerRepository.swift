//
//  ManegerRepository.swift
//  Movie
//
//  Created by Rafael Aguirre  on 30/10/20.
//

import Foundation

import Combine
import Alamofire
import SwiftyJSON



class ManegerRepository : ObservableObject
{
    var req :String = " "
   
    @Published var listpopularMovies = Peliculas()
    @Published var listTopMovies = Peliculas()
    @Published var listpopularTv = Peliculas()
    @Published var listTopTv = Peliculas()
    //var listpopularMovies = [DestailsMovie]()
    
    init() {
       
    }
    //Obtener las peliculas y guradarlas en
    
    public func routerNext(req :String, page : Int) -> Peliculas
    {
        print("\(page)")
        switch req
        {
        case EndPoint.Top:
             getMoviestopNext(Page: page)
        case EndPoint.Popular:
             getMoviesPopularNext(Page: page)
        case EndPoint.Populartv:
             getTvPopularNext(Page: page)
        case EndPoint.Toptv:
             getTvTopNext(Page: page)
        default:
            print("Url mal")
        }
        return Peliculas()
    }
    
    
    
    public func router(req :String, page : Int) -> Peliculas
    {
       
        switch req
        {
        case EndPoint.Top:
            return getMoviestop(Page: page)
        case EndPoint.Popular:
            return getMoviesPopular(Page: page)
        case EndPoint.Populartv:
            return getTvPopular(Page: page)
        case EndPoint.Toptv:
            return getTvTop(Page: page)
        default:
            print("Url mal")
        }
        return Peliculas()
    }
    
    
    public func getMoviestop(Page : Int) -> Peliculas
    {
        var aux = Peliculas()
       
        if self.listTopMovies.dataMovies.isEmpty
        {
            print("sin datos")
            MovieViewModel(request: EndPoint.Top ).data(search: EndPoint.Top, pages: Page) { (numR, movies) in
                aux = movies
                
                self.listTopMovies = aux
               
            }
            return self.listTopMovies
        }
        else
        {
            return self.listTopMovies
            
        }
    }
    
    
    public func getMoviesPopular(Page : Int) -> Peliculas
    {
        var aux = Peliculas()
        if self.listpopularMovies.dataMovies.isEmpty
        {
            print("sin datos")
            
            MovieViewModel(request: EndPoint.Popular ).data(search: EndPoint.Popular, pages: Page) { (numR, movies) in
                aux = movies
                self.listpopularMovies = aux
                
            }
            return self.listpopularMovies
            
        }
        else
        {
            
            return self.listpopularMovies
            
        }
        
    }
    
    public func getTvPopular(Page : Int) -> Peliculas
    {
        var aux = Peliculas()
        if self.listpopularTv.dataMovies.isEmpty
        {
            print("sin datos")
            
            MovieViewModel(request: EndPoint.Populartv ).data(search: EndPoint.Populartv, pages: Page) { (numR, movies) in
                aux = movies
                self.listpopularTv = aux
            }
            return self.listpopularTv
        }
        else
        {
            return self.listpopularTv
            
        }
        
    }
    
    public func getTvTop(Page : Int) -> Peliculas
    {
        var aux = Peliculas()
        if self.listTopTv.dataMovies.isEmpty
        {
            print("sin datos")
            
            MovieViewModel(request: EndPoint.Toptv ).data(search: EndPoint.Toptv, pages: Page) { (numR, movies) in
                aux = movies
                self.listTopTv = aux
            }
            return self.listTopTv
        }
        else
        {
            return self.listTopTv
            
        }
        
    }
    
    
    
    
    
    public func getMoviestopNext(Page : Int) 
    {
        var aux = Peliculas()
       
            
            MovieViewModel(request: EndPoint.Top ).data(search: EndPoint.Top, pages: Page) { (numR, movies) in
                aux = movies
                
                self.listTopMovies.dataMovies.append(contentsOf: aux.dataMovies) 
               
            }
        
      
            
        
    }
    
    
    public func getMoviesPopularNext(Page : Int)
    {
        var aux = Peliculas()
       
            print("sin datos")
            
            MovieViewModel(request: EndPoint.Popular ).data(search: EndPoint.Popular, pages: Page) { (numR, movies) in
                aux = movies
                self.listpopularMovies.dataMovies.append(contentsOf: aux.dataMovies)
                
            }
        
      
        
    }
    
    public func getTvPopularNext(Page : Int)
    {
        var aux = Peliculas()
      
            print("sin datos")
            
            MovieViewModel(request: EndPoint.Populartv ).data(search: EndPoint.Populartv, pages: Page) { (numR, movies) in
                aux = movies
                self.listpopularTv.dataMovies.append(contentsOf: aux.dataMovies)
            }
        
        
        
    }
    
    public func getTvTopNext(Page : Int)
    {
        var aux = Peliculas()
      
            
            MovieViewModel(request: EndPoint.Toptv ).data(search: EndPoint.Toptv, pages: Page) { (numR, movies) in
                aux = movies
                self.listTopTv.dataMovies.append(contentsOf: aux.dataMovies)             }
       
       
        
    }
    
    
}


