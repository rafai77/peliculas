//
//  ContentView.swift
//  Movie
//
//  Created by Rafael Aguirre  on 20/10/20.
//

import SwiftUI
//import QGrid

@available(iOS 14.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("").navigationBarTitle("TMDB Cartelera", displayMode: .inline).background(Color.blue).background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .blue
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
                
                BottomBar()
            }
            
        }
        
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

