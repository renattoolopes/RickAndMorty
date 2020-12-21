//
//  Factories.swift
//  DataTests
//
//  Created by Renato Lopes on 21/12/20.
//

import Foundation
import Data

public func makeAllEpisodesResponse() -> AllEpisodesResponse {
    let info = InfoPageResponse(count: 0, pages: 1, next: "")
    let result = [ EpisodeResponse(id: 0,
                                   name: "EpisodeTest 01",
                                   airDate: "December 2, 2013",
                                   episode: "S00E00",
                                   characters: [
                                    "https://rickandmortyapi.com/api/character/1",
                                    "https://rickandmortyapi.com/api/character/2"],
                                   url: "",
                                   created: ""),
                   EpisodeResponse(id: 1,
                                   name: "EpisodeTest 02",
                                   airDate: "December 2, 2013",
                                   episode: "S01E01",
                                   characters: [
                                    "https://rickandmortyapi.com/api/character/1",
                                    "https://rickandmortyapi.com/api/character/2"],
                                   url: "",
                                   created: "")
    ]
    return AllEpisodesResponse(info: info, results: result)
}
