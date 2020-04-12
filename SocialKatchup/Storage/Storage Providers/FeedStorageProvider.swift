//
//  FeedStorageProvider.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 16.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation

// TODO: - ADD DI

// MARK: - FeedStorageProviderProtocol
protocol FeedStorageProviderProtocol {
    
    /// List of available for user products with their main data
    var postList: [FeedPostModel] { get set }
}

struct FeedStorage: Decodable {
    let list: [FeedPostModel]
}

// MARK: - ProductsStorageService
class FeedStorageProvider: FeedStorageProviderProtocol {
    
    var postList: [FeedPostModel] = [FeedPostModel]()
    
    init() {
        self.postList = self.loadJson(filename: "posts")
    }
    
    private func loadJson(filename fileName: String) -> [FeedPostModel] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let storageData = try JSONDecoder().decode(FeedStorage.self, from: data)
                return storageData.list
            } catch {
                debugPrint("Error in \(self) ==> \(error.localizedDescription)")
                return []
            }
        }
        return []
    }
}
