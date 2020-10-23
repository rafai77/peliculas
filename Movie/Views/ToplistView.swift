//
//  ToplistView.swift
//  Movie
//
//  Created by Rafael Aguirre  on 21/10/20.
//

import SwiftUI
import QGrid

struct ToplistView: View {
    @ObservedObject var manager = TopratedConection()
    @State var page : Int = 1
    
    var body: some View {
       

           
                Text("\(self.manager.movieList2.count)").background(Color.blue)
                List((0..<(self.manager.movieList2.count/4) ) , id : \.self )
                                { i in
                                HStack
                                {
                                    ForEach (0..<4)
                                    { j in
                                        //Text("\(j+(i*4))")
                                    CellMovies(urlimagen: self.manager.movieList2[j+(i*4)].poster, titulo: self.manager.movieList2[j+(i*4)].title , tituloO: self.manager.movieList2[j+(i*4)].original_title, vote: self.manager.movieList2[j+(i*4)].vote_average, popularity: self.manager.movieList2[j+(i*4)].vote_average)
                                    }
                        }.onDisappear( perform: {
                                    
                                    self.getNextPageIfNecessary(encounteredIndex: i)
                                    
                                })
                }
                    
              
                
            
            
           
    }
    private func getNextPageIfNecessary(encounteredIndex: Int) {
        guard encounteredIndex == manager.movieList2.count/4-1  else { return }
        self.page += 1
        print(self.page)
        self.manager.nextpage(page: self.page)
    }
}

struct ToplistView_Previews: PreviewProvider {
    static var previews: some View {
        ToplistView()
    }
}
