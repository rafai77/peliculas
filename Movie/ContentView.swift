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
    @ObservedObject var manager2 : ManegerRepository = ManegerRepository()

    var body: some View {
        NavigationView
        {
           
            ZStack
            {
                Color.black.ignoresSafeArea()
                Text("").navigationBarTitle("TMDB Cartelera", displayMode: .inline).background(Color.blue).background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .blue
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
                
                BottomBar().environmentObject(self.manager2)
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

