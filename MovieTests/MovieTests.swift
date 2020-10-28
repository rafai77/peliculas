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
    
    func testTopMoviesTop()// varifica si se puede crear el objeto
    {
        let expectation = self.expectation(description: " Al servidor")
        var results: Int?
        
        self.movieMV.data(search : EndPoint.Top ,pages: 1) { (det, aux) in
            results = det
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssert(results! >= 20, "No se cargaron los primeros 20 datos")
       

    }
    
    func testTopMoviesNext()// varifica si se puede dar otra pagina
    {
        let expectation = self.expectation(description: " Al servidor")
        var results: Int?
        
        self.movieMV.data(search : EndPoint.Top ,pages: 2) { (det, aux) in
            results = det
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssert(results! >= 20, "No se cargaron los primeros 20 datos")
       

    }
    func testSearchall()// varifica si se puede dar otra pagina
    {
       // let expectation = self.expectation(description: " Al servidor")
        //var results: Int?
        
        self.movieMV.Search(search: EndPoint.Search + "Batman", page: 1)
        print(self.movieMV.movieList2.count)
       // wait(for: [expectation], timeout: 5)
        //XCTAssert(results! >= 20, "No se cargaron los primeros 20 datos")
       

    }
    
    

}
