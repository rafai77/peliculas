//
//  BarSearch.swift
//  Movie
//
//  Created by Rafael Aguirre  on 23/10/20.
//
import Foundation
import SwiftUI

struct BarSearch: UIViewRepresentable
{
    @Binding var textsearh: String
   
    
    func makeUIView(context: UIViewRepresentableContext<BarSearch>) -> some UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = context.coordinator
        return searchbar
        
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<BarSearch>) {
        uiView.text = textsearh

    }
    
    func makeCoordinator() -> BarSearch.Coordinator {
        return Coordinator(text : $textsearh )
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var textsearh: String
        
        init(text : Binding<String>)
        {
            _textsearh = text
        }
        
        func searchBar(_ searchBar: UISearchBar , textDidChange searchText : String)  {
            textsearh = searchText
        }
    }
    
    
}
