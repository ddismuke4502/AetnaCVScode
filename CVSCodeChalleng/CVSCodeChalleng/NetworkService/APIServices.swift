//
//  APIEndpoints.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation

class APIEndpoints {
    static func imagesApiUrl(_ searchWord: String) -> String {
        return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchWord)"
    }
}
