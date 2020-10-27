//
//  ListvView.swift
//  Movie
//
//  Created by Rafael Aguirre  on 22/10/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct ListvView: View {
    @State var firstAppear: Bool = true
    var req : String
    @ObservedObject var manager :MovieViewModel
    @State var page : Int = 1
    init(req :String) {
        self.manager =  MovieViewModel(request: req)
        self.req = req
        
    }
    
    public var body: some View {
        //Text("\(self.manager.movieList2.count)").background(Color.blue)
        if (self.manager.movieList2.isEmpty)
        {
            ProgressView()

        }
        else
        {
            List((0..<(self.manager.movieList2.count/4) ) , id : \.self )
            { i in
                HStack
                {
                    ForEach (0..<4)
                    { j in
                        let title: String = self.manager.movieList2[j+(i*4)].title == "0" ? self.manager.movieList2[j+(i*4)].name : self.manager.movieList2[j+(i*4)].title
                        let titleO: String = self.manager.movieList2[j+(i*4)].original_title == "0" ? self.manager.movieList2[j+(i*4)].original_name : self.manager.movieList2[j+(i*4)].original_title
                        
                        CellMovies(urlimagen: self.manager.movieList2[j+(i*4)].poster, titulo: title , tituloO: titleO, vote: self.manager.movieList2[j+(i*4)].vote_average, popularity: self.manager.movieList2[j+(i*4)].vote_average)
                    }
                    
                }.onAppear(perform:
                            {
                                if !self.firstAppear { return }
                                self.getNextPageIfNecessary(encounteredIndex: i)
                              
                            })
                
                
            }
        }
        
    }
    private func getNextPageIfNecessary(encounteredIndex: Int) {
        guard encounteredIndex == manager.movieList2.count/4-1  else { return }
        self.page += 1
        
        self.manager.nextpage(page: self.page)
    }
}

struct ListvView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ListvView(req: "0")
        } else {
            // Fallback on earlier versions
        }
    }
}
