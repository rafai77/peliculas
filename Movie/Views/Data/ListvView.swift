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
    //@EnvironmentObject var manager2 : ManegerRepository
    //@State var manager2.getMoviestop(): Peliculas = Peliculas()
    @ObservedObject var Manager : ManegerRepository  =  ManegerRepository.Manager
    
    @State private var isShowing = false
    @State var page : Int = 1
    init(req :String) {
        ///self.manager =  MovieViewModel(request: req)
        self.req = req
        
        
        //self.page = self.manager2.router(req: self.req , page: self.page).dataMovies.count / 20
        //self.list = self.manager2.getMoviestop()
        
        
        UIScrollView.appearance().backgroundColor = .black
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().tableFooterView = UIView()
        
        
        
    }
    
    public var body: some View {
       // Text("\( Manager.router(req: self.req , page: self.page).dataMovies.count)")
        Text("\( Manager.router(req: self.req , page: self.page).dataMovies.count)").background(Color.blue)
        Text("\(self.page)")

        if ( Manager.router(req: self.req ,  page: self.page).dataMovies.isEmpty)
        {
            ProgressView().background(Color.white)
            //Text("\(self.Manager.movieList.dataMovies.count)")

        }
        else
        {
            
            List((0..<( Manager.router(req: self.req ,   page: self.page).dataMovies.count/4) ) , id : \.self )
            { i in
                HStack
                {
                    ForEach (0..<4)
                    { j in
                        let title: String =  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].title == "0" ?  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].name :  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].title
                        let titleO: String =  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_title == "0" ?  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_name :  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].original_title
                        //NavigationLink()
                        ScrollView(.horizontal, showsIndicators: true)
                        {
                            NavigationLink(destination: Details( details:  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)] )) {
                                CellMovies(urlimagen:  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].poster, titulo: title , tituloO: titleO, vote:  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].vote_average, popularity:  Manager.router(req: self.req ,  page: self.page).dataMovies[j+(i*4)].vote_average)

                            }

                        }.padding(.all, -15).onAppear {
                            getNextPageIfNecessary(encounteredIndex: i,index2: j)
                            self.page =  Manager.router(req: self.req ,   page: self.page).dataMovies.count/20

                        }
                    }
                }

            }.pullToRefresh(isShowing: $isShowing) {

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.page = 1
                     Manager.router(req: self.req ,  page: -1)
                    self.page =  Manager.router(req: self.req ,   page: self.page).dataMovies.count/20
                    self.isShowing = false
                }
            }


        }
    }
    
    private func getNextPageIfNecessary(encounteredIndex: Int, index2 : Int) {
        guard (encounteredIndex ==  Manager.router(req: self.req , page: self.page).dataMovies.count/4-1 && index2 == 3)  else { return }
        print("next")
        self.page += 1
        
         Manager.routerNext(req: self.req, page: self.page)
                //self.Manager.nextpage(page:  page: self.page)
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
