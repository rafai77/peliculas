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
        //self.movieMV = MovieViewModel(request: EndPoint.Top)
    }
    
    override func tearDown() {
        //self.movieMV = nil
        super.tearDown()
    }
    
    func testTopMovies()
    {
        let expectation = self.expectation(description: " Al servidor")
        var results: Int?
        MovieViewModel(request: EndPoint.Top).data { (res) in
            results=res
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        print("sdf",results!)
       

    }
    
    

}
