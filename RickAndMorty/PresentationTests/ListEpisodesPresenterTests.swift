//
//  ListEpisodesPresenterTests.swift
//  PresentationTests
//
//  Created by Renato Lopes on 21/12/20.
//

import XCTest
import Presentation
import Domain

class ListEpisodesPresenterTests: XCTestCase {

    func testIfShowLoadingWhenIsCalledFindAllEpisodes() {
        let loading = LoadingSpy()
        let listAll = ListEpisodesSpy()
        let sut: ListEpisodesPresenter = makeSut(loading: loading,useCase: listAll)
        let promise = expectation(description: "Waiting Loading")
       
        loading.observer { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: true))
            promise.fulfill()
        }
        sut.findAllEpisodes()
        
        wait(for: [promise], timeout: 2.0)
        let secondPromise = expectation(description: "Waiting Loading")

        loading.observer { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: false))
            secondPromise.fulfill()
        }
        
        listAll.complitionWithError()
        wait(for: [secondPromise], timeout: 2.0)
    }
    
    func testIfShowAlertWhenReturnsErrorInFindAllEpisodes() {
        let alert = AlertSpy()
        let listAll = ListEpisodesSpy()
        let sut: ListEpisodesPresenter = makeSut(alert: alert, useCase: listAll)
        let promise = expectation(description: "Waiting Alert")
        
        alert.observer { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Ocorreu um erro!", message: "Falha ao obter as informações"))
            promise.fulfill()
        }
        sut.findAllEpisodes()
        listAll.complitionWithError()
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectEpisodesWhenIsSendEpisodesByReactivityDelegate() {
        let reactivity = ListEpisodesReactivitySpy()
        let listAll = ListEpisodesSpy()
        let sut: ListEpisodesPresenter = makeSut(useCase: listAll, reactivity: reactivity)
        let promise = expectation(description: "Waiting Alert")
        let expected: [EpisodeViewModel] = makeEpisodesViewModel()
        
        reactivity.observer { (episodes) in
            XCTAssertEqual(expected, episodes)
            promise.fulfill()
        }
        sut.findAllEpisodes()
        listAll.complitionWithSuccess(makeEpisodes())
        wait(for: [promise], timeout: 2.0)
    }
    
}

extension ListEpisodesPresenterTests {
    func makeSut(loading: LoadingViewProtocol = LoadingSpy(),
                 alert: AlertViewProtocol = AlertSpy(),
                 useCase: ListEpisodes = ListEpisodesSpy(),
                 reactivity:ListEpisodesReactivitySpy = ListEpisodesReactivitySpy()) -> ListEpisodesPresenter {
        
        return ListEpisodesPresenter(listEpisodesUseCase: useCase,
                                     loadingView: loading,
                                     alertView: alert,
                                     delegate: reactivity)
    }
    
    func makeEpisodes() -> [Episode] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let defaultDate = formatter.date(from: "2020/01/01")
        
        return [
            Episode(name: "Episodio 01", airDate: defaultDate, sessionEpisodeCode: "S01E01"),
            Episode(name: "Episodio 02", airDate: defaultDate, sessionEpisodeCode: "S01E02")
        ]
    }
    
    func makeEpisodesViewModel() -> [EpisodeViewModel] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let defaultDate = formatter.date(from: "2020/01/01")
        
        return [
            EpisodeViewModel(name: "Episodio 01" ,
                airDate: defaultDate,
                sessionEpisodeCode: "S01E01"),
            EpisodeViewModel(name: "Episodio 02" ,
                airDate: defaultDate,
                sessionEpisodeCode: "S01E02")
        ]
    }
}
