//
//  EndPoint.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import Foundation


struct EndPoint {
    static var Popular = Constants.URL +
        Constants.Popular +
        Constants.KEY +
        Constants.Language +
        Constants.Page;
    static var Top = Constants.URL +
        Constants.Top_rated +
        Constants.KEY +
        Constants.Language +
        Constants.Page;
    static var Gener =
          Constants.DOMAING + "list?api_key=" + Constants.KEY + Constants.Language;
    static var Populartv = Constants.URLTV +
        Constants.Popular +
        Constants.KEY +
        Constants.Language +
        Constants.Page;
    static var Toptv = Constants.URLTV +
        Constants.Top_rated +
        Constants.KEY +
        Constants.Language +
        Constants.Page;
    static var Search = Constants.URLSearch + Constants.KEY + Constants.Language + Constants.query; // se inserta la query y luego se pone la pagina puden ser varias paginas 
        
    
    
}
