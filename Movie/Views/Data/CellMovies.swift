//
//  CellMovies.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation


@available(iOS 14.0, *)
struct CellMovies: View {
    var urlimagen: String
    var titulo : String
    var tituloO : String // titulo original
    var vote : Double
    var popularity : Double
    
    var body: some View {
        
        ZStack
        {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading)
            {
                
                AnimatedImage(url: URL(string:  Constants.Imagedom+urlimagen)).resizable()
                    .frame(width: 85, height: 150)
                
                VStack
                {
                    Spacer()
                    Text(self.tituloO).foregroundColor(.white).font(.none).lineLimit(1).frame(width: 85)
                    Text("("+self.titulo+")").foregroundColor(.white).font(.subheadline).multilineTextAlignment(.leading).lineLimit(2).frame(width: 85)
                    
                    Spacer()
                    
                }.frame(width: 85, height: 85).padding(0).listRowBackground(Color.red)
                
                
                
                
                
                
                
            }
        }
        
    }
    
    
    
}
@available(iOS 14.0, *)
struct CellMovies_Previews: PreviewProvider {
    static var previews: some View {
        CellMovies(urlimagen: "imagen", titulo: "titulo",tituloO: " sdfsdf", vote: 0.0 ,popularity: 0.0 )
    }
}
