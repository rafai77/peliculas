//
//  MovieTests.swift
//  MovieTests
//
//  Created by Rafael Aguirre  on 26/10/20.
//

@testable import Movie
import XCTest


class MovieTests: XCTestCase {
    
    var movieMV : MovieViewModel!
    
    override func setUp() {
        super.setUp()
        self.movieMV = MovieViewModel(request: EndPoint.Top)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    

}
