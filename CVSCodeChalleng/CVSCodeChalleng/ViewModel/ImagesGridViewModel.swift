//
//  ImagesGridViewModel.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation
import Combine

protocol ImagesGridViewModelActions{
    func getImages(_ urlString: String) async
}

enum PhotoSearchViewStates {
    case loading(imagesList: [Item])
    case error(message: String)
}

final class ImagesGridViewModel: ObservableObject {
    
    @Published var photoSearchViewStates: PhotoSearchViewStates = .loading(imagesList: [])
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkManager: NetworkingProtocol
    
    init(networkManager: NetworkingProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension ImagesGridViewModel:ImagesGridViewModelActions {
    
    @MainActor
    func getImages(_ urlString: String) async {
        do {
            let imageData = try await networkManager.get(apiURL: urlString, type: ImagesResponseData.self)
            photoSearchViewStates = .loading(imagesList: imageData.items)
        } catch let error {
            photoSearchViewStates = .error(message: error.localizedDescription)
        }
    }
}
