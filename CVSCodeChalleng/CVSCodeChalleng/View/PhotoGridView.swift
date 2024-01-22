//
//  PhotoGridView.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import SwiftUI
import Combine

struct PhotoGridView: View {
    @StateObject var viewModel = ImagesGridViewModel()
    @Namespace private var imageNamespace
    @Environment(\.horizontalSizeClass) var sizeClass

    @State var searchText: String = ""
    @State var isErrorOccured: Bool = false

    // number of columns for landscape
    private var gridColumns: [GridItem] {
        let numberOfColumns = sizeClass == .compact ? 2 : 4 // the right-side is the landscape
        return Array(repeating: .init(.flexible()), count: numberOfColumns)
    }

    var body: some View {
        NavigationStack {
            searchView(gridColumns)
                .searchable(text: $searchText, 
                            placement: .automatic,
                            prompt: "Search People and Things")
                .onChange(of: searchText, initial: true) { oldValue, newValue in
                    Task {
                        await viewModel.getImages(APIEndpoints.imagesApiUrl(newValue))
                    }
                }
        }
    }

    @ViewBuilder
    private func searchView(_ columns: [GridItem]) -> some View {
        switch viewModel.photoSearchViewStates {
        case .loading(imagesList: let imagesList):
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(imagesList) { imageData in
                        NavigationLink(destination: DetailsScreen(cellData: imageData, namespace: imageNamespace)) {
                            GridViewCell(cellData: imageData, namespace: imageNamespace).frame(width: 120,height: 120)
                        }
                    }
                }
            }
        case .error(message: let message):
            Text(message)
        }
    }
}

#Preview {
    PhotoGridView()
}

