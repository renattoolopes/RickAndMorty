//
//  RemoteListEpisodesTests.swift
//  DataTests
//
//  Created by Renato Lopes on 17/12/20.
//

import XCTest
import Data
import Domain

class RemoteListEpisodesTests: XCTestCase {
    
    func testIfWasRequestedEpisodesWithCorrectURL() {
        let url: URL = URL(string: "https://expectedurl.com.br")!
        let httpClient = HttpGetSpy()
        let sut = RemoteListEpisodes(httpGetClient: httpClient , url: url)
        sut.listAll { _ in }
        XCTAssertEqual(url, httpClient.url)
    }
    
    func testIfReturnCorrectErrorWhenRequestFailed() {
        let url: URL = URL(string: "https://expectedurl.com.br")!
        let httpClient = HttpGetSpy()
        let sut = RemoteListEpisodes(httpGetClient: httpClient , url: url)
        let expected: HttpClientError = .badRequest
        let promise = expectation(description: "List all")
        
        sut.listAll { (result) in
            switch result {
            case .success:
                XCTFail("Incorrect completion")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, expected.localizedDescription)
            }
            promise.fulfill()
        }
        httpClient.completionWithError(error: .badRequest)
        wait(for: [promise], timeout: 1.0)
    }
    
    
    func testIfReturnCorrectEpisodes() {
        let url: URL = URL(string: "https://expectedurl.com.br")!
        let httpClient = HttpGetSpy()
        let sut = RemoteListEpisodes(httpGetClient: httpClient , url: url)
        let date = "December 2, 2013".date()
        let expected: [Episode] = [
            Episode(name: "EpisodeTest 01", airDate: date, sessionEpisodeCode: "S00E00"),
            Episode(name: "EpisodeTest 02", airDate: date, sessionEpisodeCode: "S01E01")
        ]
        let promise = expectation(description: "List all")

        sut.listAll { result in
            switch result {
            case .success(let episodes):
                XCTAssertEqual(episodes, expected)
            case .failure(let error):
                XCTFail("Incorrect completion \(error.localizedDescription)")
            }
            promise.fulfill()
        }
        
        httpClient.completionWithSuccess(makeAllEpisodesResponse().convertToData())
        wait(for: [promise], timeout: 1.0)        
    }
}
