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
        self.movieMV = MovieViewModel(request: EndPoint.Top )
    }
    
    override func tearDown() {
        //self.movieMV = nil
        super.tearDown()
    }
    
    func testTopMovies()
    {
        let expectation = self.expectation(description: " Al servidor")
        var results: Int?
        
        self.movieMV.data(pages: 1) { (det, aux) in
            results = det
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssert(results! >= 20, "No se cargaron los primeros 20 datos")
       

    }
    
    

}
