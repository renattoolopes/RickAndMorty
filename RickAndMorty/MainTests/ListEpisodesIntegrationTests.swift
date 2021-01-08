//
//  ListEpisodesIntegrationTests.swift
//  MainTests
//
//  Created by Renato Lopes on 07/01/21.
//

import XCTest
import Main
import UI

class ListEpisodesIntegrationTests: XCTestCase {

    func testIfExistMemoryLeakInViewController() {
        let listEpisodesSpy: ListEpisodesSpy = ListEpisodesSpy()
        let sut: ListEpisodesViewController = ListEpisodesControllerFactory.instance(with: listEpisodesSpy)
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut)
        }
    }
    
    func testIfExcutedUIManipulationsInMainThread() {
        let listEpisodesSpy: ListEpisodesSpy = ListEpisodesSpy()
        let sut: ListEpisodesViewController = ListEpisodesControllerFactory.instance(with: listEpisodesSpy)
        let promise = expectation(description: "Try force crash in UI after callback of request")
        sut.loadViewIfNeeded()
        sut.listAllEpisodes()
        DispatchQueue.global().async {
            listEpisodesSpy.complitionWithError()
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
    }
    
}
