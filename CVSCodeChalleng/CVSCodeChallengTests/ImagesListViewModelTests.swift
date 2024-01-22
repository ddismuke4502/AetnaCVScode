//
//  ImagesListViewModelTests.swift
//  CVSCodeChallengTests
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import XCTest
@testable import CVSCodeChalleng

final class ImagesListViewModelTests: XCTestCase {

    var viewModel: ImagesGridViewModel!
    let netowrkManager:NetworkingProtocol = FakeNetworkManager()
    override func setUp() {
        viewModel = ImagesGridViewModel(networkManager: netowrkManager)
    }

    override func tearDown() {
        viewModel = nil
    }
    
    func test_getImages_success() async {
        
        // state before calling getImages
        XCTAssertEqual(viewModel.photoSearchViewStates, .loading(imagesList: []))
        await viewModel.getImages("mockUrl")
        
        // state after calling getImages
        XCTAssertEqual(viewModel.photoSearchViewStates, .loading(imagesList: ImagesResponseData.imageResponseData.items))
    }
    
    func test_getImages_failure() async {
        
        // before calling api
        XCTAssertEqual(viewModel.photoSearchViewStates, .loading(imagesList: []))
        await viewModel.getImages("")
        XCTAssertEqual(viewModel.photoSearchViewStates, .error(message:APIError.urlError.localizedDescription))
    }
}

extension PhotoSearchViewStates: Equatable {
    public static func == (lhs: CVSCodeChalleng.PhotoSearchViewStates, rhs: CVSCodeChalleng.PhotoSearchViewStates) -> Bool {
        switch (lhs , rhs) {
        case (.loading(let lhsItems),   .loading(let rhsItems)):
            return lhsItems.count == rhsItems.count
        case (.error(let lhsError ), .error(message: let rhsError)):
            return lhsError == rhsError
        case (.error(message: _), .loading(imagesList:_)):
            return false
        case (.loading(imagesList:_), .error(message:_)):
            return false
        }
    }
}
