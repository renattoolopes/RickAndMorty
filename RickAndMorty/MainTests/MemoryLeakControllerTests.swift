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
        let listEpisodesSpy: ListEpisodes = 
        let sut: ListEpisodesViewController = ListEpisodesControllerFactory.instance(with: listEpisodesSpy)
        
    }
}
