//
//  Search.swift
//  Movie
//
//  Created by Rafael Aguirre  on 23/10/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct Search: View {
    @State var texto : String = ""
    @State var control = ListvView(req: EndPoint.Search + "" + Constants.Page )
    var body: some View {
        VStack
        {
            BarSearch(textsearh: $texto)
            if texto.isEmpty
            {
                Image(systemName: "magnifyingglass.circle.fill").resizable().frame(width: 50, height: 50, alignment: .center).padding(100)
            }
            else
            {
                 
                
                
                //self.search(req: EndPoint.Search + "Batman" + Constants.Page, page: 1)
                Text(texto).onChange(of: texto) { (t) in
                    control.manager.Search(search: EndPoint.Search +  t.replacingOccurrences(of: " ", with: "%20") + Constants.Page, page: 1)
                    
                }
               
                control.body
                       
                 
                   
               
                                
        }
            
            
        }
        
    }
    
    func search(req : String , page: Int )
    {
        control.manager.Search(search: req , page: page)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            Search()
        } else {
            // Fallback on earlier versions
        }
    }
}
