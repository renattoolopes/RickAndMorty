//
//  MemoryLeakControllerTests.swift
//  MainTests
//
//  Created by Renato Lopes on 07/01/21.
//

import XCTest
import Main
import UI

class MemoryLeakControllerTests: XCTestCase {

    func testDealocationListEpisodesViewController() {
        let listEpisodesSpy: ListEpisodesSpy = ListEpisodesSpy()
        let sut: ListEpisodesViewController = ListEpisodesControllerFactory.instance(with: listEpisodesSpy)
        addTeardownBlock {
            XCTAssertNil(sut)
        }
    }
}
