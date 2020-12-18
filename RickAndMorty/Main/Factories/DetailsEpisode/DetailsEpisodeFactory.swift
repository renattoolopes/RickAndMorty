//
//  DetailsEpisodeFactory.swift
//  Main
//
//  Created by Renato Lopes on 17/12/20.
//

import Foundation
import Domain
import Data
import Infra
import Presentation
import UI

final class DetailsEpisodeFactory {

    public static func instance() -> DetailsEpisodeViewController {
        return DetailsEpisodeViewController()
    }
}
