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
    
    @ObservedObject var cast :CastViewModel
    var details :DestailsMovie
    init(details : DestailsMovie) {
        self.details = details
        if self.details.title == "0"
        {
            self.cast = CastViewModel(req: Constants.URLTV + "\(self.details.id)/credits?api_key=" + Constants.KEY + Constants.Language)
        }
        else
        {
            self.cast = CastViewModel(req: Constants.URL + "\(self.details.id)/credits?api_key=" + Constants.KEY + Constants.Language)
            
        }
        
    }
    
    var body: some View {
        ScrollView
        {
                         
            VStack(alignment: .center, spacing: 10)
                {
                Color.black.ignoresSafeArea().opacity(0.7)
                    
                    let title: String = self.details.title == "0" ? self.details.name : self.details.title
                    let titleO: String = self.details.original_title == "0" ? self.details.original_name : self.details.original_title
                    Text(titleO ).foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(maxWidth: 500).background(Color.red)
                    AnimatedImage(url: URL(string: Constants.Imagedom+details.poster)).resizable().frame(width: 150, height: 250)
                   
                        Text("( \(title) )").foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(details.overview).foregroundColor(.white).frame(width: 350, height: 350, alignment: .center)
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25)
                        {
                            Text(" \(details.vote_average) % ").foregroundColor(.white).font(.footnote).fontWeight(.thin).background(Color.blue).cornerRadius(25)
                            Text(" \(details.popularity)  ").foregroundColor(.white).font(.footnote).fontWeight(.thin).background(Color.red).cornerRadius(25)
                        }
                        if (details.date != "0")
                        {
                            Text("Fecha: (\(details.date))").foregroundColor(.white).frame(maxWidth: 500)
                            
                        }
                        Text("Lenguaje Original : \(details.lenguaje)").foregroundColor(.white)
                        
                        
                    ScrollView(.horizontal, showsIndicators: true)
                        {
                            HStack
                            {
                                
                                ForEach (0..<self.cast.cast.count)
                                { i in
                                    
                                    ActorCell(cast: self.cast.cast[i])
                                }
                                
                            }
                            
                        
                    }
                }.background( Color.black.ignoresSafeArea().opacity(0.7)).modifier(BackgroundImage(path: details.backdrop_path)).padding(.top , -20)
                }
                        
            
        }
    }



struct BackgroundImage: ViewModifier {
    var path: String
    func body(content: Content) -> some View {
        content
            
            .background(AnimatedImage(url: URL(string: Constants.Imagedom + self.path )).scaledToFill())
    
    }
}


