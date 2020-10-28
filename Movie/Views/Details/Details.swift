//
//  Details.swift
//  Movie
//
//  Created by Rafael Aguirre  on 27/10/20.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation

@available(iOS 14.0, *)

struct Details: View {
    
    var details :DestailsMovie
    var body: some View {
        VStack(spacing: 20)
        {
            VStack
            {
                let title: String = self.details.title == "0" ? self.details.name : self.details.title
                let titleO: String = self.details.original_title == "0" ? self.details.original_name : self.details.original_title
                Text(titleO )
                VStack(spacing: 25)
                {
                 AnimatedImage(url: URL(string: " ")).resizable().frame(width: 150, height: 250)
                    VStack(alignment: .center , spacing: nil)
                    {
                        Text("( \(title) )")
                        Text("Descripcion")
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25)
                        {
                            Text(" 13.5 % ").font(.footnote).fontWeight(.thin).background(Color.blue).cornerRadius(25)
                            Text(" 99.0 ").font(.footnote).fontWeight(.thin).background(Color.red).cornerRadius(25)
                        }
                        HStack
                        {
                            Text("Genero")
                            Text("leguaje")
                        }
                        HStack
                        {
                            Text("Lista de actores")
                            
                        }
                    }
                    
                }
                   
                
                VStack(alignment: .leading )
                {
                    
                }
               
                    
                
            }
           
            Spacer()
            
           
            
        }
        
    }
}


