//
//  URLSessionAdapterTests.swift
//  InfraTests
//
//  Created by Renato Lopes on 20/12/20.
//

import XCTest
import Infra
import Data

class URLSessionAdapterTests: XCTestCase {
    
    func testIfRequestContainsCorrectValues() {
        let sut: URLSessionAdapter = makeSut()
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")
        
        URLStubProtocol.observerRequest { (request) in
            XCTAssertEqual(self.makeFakeURL(), request.url!)
            XCTAssertEqual("GET", request.httpMethod)
            XCTAssertNil(request.httpBodyStream)
            promise.fulfill()
        }
        
        sut.get(url: makeFakeURL()) { _ in }
        wait(for: [promise], timeout: 2)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithNoConnectivity() {
        let sut: URLSessionAdapter = makeSut()
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 300, httpVersion: nil, headerFields: nil)
        
        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.noConnectivity, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithStatusCode300() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 500, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.serverError, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithStatusCode401() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 401, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.unauthorized, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithStatusCode403() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 403, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.forbidden, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithStatusCode400() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 400, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.badRequest, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnCorrectErrorWhenRequestIsFailedWithStatusCode500() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 500, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(HttpClientError.serverError, error)
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnNilWhenRequestIsSuccessWithStatusCode204() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 204, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")

        URLStubProtocol.simulate(data: nil, response: response, error: nil )
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure:
                XCTFail()
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
    
    func testIfReturnDataWhenRequestIsSuccessWithStatusCode200() {
        let sut: URLSessionAdapter = makeSut()
        let response: HTTPURLResponse? = HTTPURLResponse(url: makeFakeURL(), statusCode: 200, httpVersion: nil, headerFields: nil)
        let promise: XCTestExpectation = XCTestExpectation(description: "Waiting Request")
        let expectedResponse: AllEpisodesResponse = makeAllEpisodesResponse()
        let data: Data? = expectedResponse.convertToData()
        URLStubProtocol.simulate(data: data, response: response, error: nil)
        
        sut.get(url: makeFakeURL()) { result in
            switch result {
            case .success(let data):
                let model: AllEpisodesResponse? = data?.convertToModel()
                XCTAssertEqual(expectedResponse, model)
            case .failure:
                XCTFail()
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 2.0)
    }
}

extension URLSessionAdapterTests {
    func makeSut() -> URLSessionAdapter {
        let configuration: URLSessionConfiguration = .default
        configuration.protocolClasses = [URLStubProtocol.self]
        return URLSessionAdapter(configuration: configuration)
    }
    
    func makeFakeURL() -> URL {
       return URL(string: "https://exampleapi/v1")!
    }
}
