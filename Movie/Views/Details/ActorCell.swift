//
//  ActorCell.swift
//  Movie
//
//  Created by Rafael Aguirre  on 28/10/20.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation


struct ActorCell: View {
    var cast : Cast
    var body: some View {
        ZStack
        {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading)
            {
                
                AnimatedImage(url: URL(string:  Constants.Imagedom + cast.profile_path)).resizable()
                    .frame(width: 85, height: 150)
                
                VStack
                {
                    Spacer()
                    Text(cast.name).foregroundColor(.white).font(.none).lineLimit(1).frame(width: 85)
                    Text("("+cast.character+")").foregroundColor(.white).font(.subheadline).multilineTextAlignment(.leading).lineLimit(2).frame(width: 85)
                    
                    Spacer()
                    
                }.frame(width: 85, height: 85).padding(0).listRowBackground(Color.red)
                
                
                
                
                
                
                
            }
        }
    }
}


