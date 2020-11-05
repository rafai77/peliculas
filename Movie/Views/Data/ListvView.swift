//
//  ListvView.swift
//  Movie
//
//  Created by Rafael Aguirre  on 22/10/20.
//

import SwiftUI
import SwiftUIRefresh


@available(iOS 14.0, *)
struct ListvView: View {
    @State var firstAppear: Bool = true
    var req : String
    //@ObservedObject var manager :MovieViewModel
    @EnvironmentObject var manager2 : ManegerRepository 
    //@State var manager2.getMoviestop(): Peliculas = Peliculas()
    @State var list : Peliculas  = Peliculas()
    
    @State private var isShowing = false
    @State var page : Int = 1
    init(req :String) {
        ///self.manager =  MovieViewModel(request: req)
        self.req = req
        //self.list = self.manager2.getMoviestop()
       
     
        UIScrollView.appearance().backgroundColor = .black
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().tableFooterView = UIView()
        
        
        
    }
    
    public var body: some View {
        Text("\(self.manager2.router(req: self.req , page: self.page).dataMovies.count)").background(Color.blue)
        Text("\(self.page)")
        
        if (self.manager2.router(req: self.req ,  page: self.page).dataMovies.isEmpty)
        {
            ProgressView().background(Color.white)
            //Text("\(self.manager.movieList.dataMovies.count)")
            
        }
        else
        {
          
            List((0..<(self.manager2.router(req: self.req ,   page: self.page).dataMovies.count/4) ) , id : \.self )
            { i in
                HStack
                {
                ForEach (0..<4)
                { j in
                    let title: String = self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].title == "0" ? self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].name : self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].title
                    let titleO: String = self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_title == "0" ? self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_name : self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_title
                    //NavigationLink()
                    ScrollView(.horizontal, showsIndicators: true)
                    {
                        NavigationLink(destination: Details( details: self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)] )) {
                            CellMovies(urlimagen: self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].poster, titulo: title , tituloO: titleO, vote: self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].vote_average, popularity: self.manager2.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].vote_average)

                        }

                    }.padding(.all, -15).onAppear {
                        getNextPageIfNecessary(encounteredIndex: i,index2: j)
                }
                }
        }

          }
            
            
        }
    }
    
    private func getNextPageIfNecessary(encounteredIndex: Int, index2 : Int) {
        guard (encounteredIndex == self.manager2.router(req: self.req , page: self.page).dataMovies.count/4-1 && index2 == 3)  else { return }
        print("next")
         self.page += 1
        self.manager2.routerNext(req: self.req, page: self.page)
        
        //self.manager.nextpage(page:  page: self.page)
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
