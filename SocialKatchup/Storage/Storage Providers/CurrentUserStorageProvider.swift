//
//  CurrentUserStorageProvider.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation
import Combine

// TODO: - ADD DI

// MARK: - FeedStorageProviderProtocol
protocol CurrentUserStorageProviderProtocol {
    
    ///Return current User
     func getCurrentUser() -> CurrentUserModel?
}

/// - Storage Struct for User
struct CurrentUserStorage: Decodable {
    let current_user: CurrentUserModel
}

// MARK: - ProductsStorageService
class CurrentUserStorageProvider: CurrentUserStorageProviderProtocol {

    func getCurrentUser() -> CurrentUserModel? {
        if let url = Bundle.main.url(forResource: "user", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let storageData = try JSONDecoder().decode(CurrentUserStorage.self, from: data)
                let user = storageData.current_user
                return user
            } catch {
                debugPrint("Error in \(self) ==> \(error.localizedDescription)")
                return nil
            }
        } else {
            return nil
        }
    }
}

