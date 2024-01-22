//
//  GridViewCell.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import SwiftUI

struct GridViewCell: View {
    
    let cellData: Item
    var namespace: Namespace.ID

    var body: some View {

                VStack(spacing: 10){
                    AsyncImage(url: URL(string: cellData.media.m)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView().frame(width: 100, height: 100)
                    }
                    .matchedGeometryEffect(id: cellData.media.m, in: namespace)
                    .accessibilityHidden(true) // this is not important enough to used as VoiceOver, so I am hiding it from VoiceOver detection
                    
                    Text(cellData.title)
                        .font(.body) // body is a very good start off for Dynamic Type su
                        .foregroundStyle(.black)
                        .accessibilityLabel("Title: \(cellData.title)")
                    
                }
    }
}

#Preview {
    GridViewCell(cellData: Item(title: "Horned Lark", link: "https://www.flickr.com/photos/amketter/53469306909/", media: Media(m: "https://live.staticflickr.com/65535/53469340586_41dbf5e79c_m.jpg"), dateTaken: "", description: "", published: "", author: "nobody@flickr.com", authorID: "", tags: ""), namespace: Namespace().wrappedValue)
}
