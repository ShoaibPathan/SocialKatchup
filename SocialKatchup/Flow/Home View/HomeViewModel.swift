//
//  HomeViewModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    // - Internal Properties
    @Published internal var currentUser: CurrentUserModel?
    
    // - Private Properties
    private let storageProvider: CurrentUserStorageProviderProtocol
    
    init() {
        self.storageProvider = CurrentUserStorageProvider()
        self.currentUser = storageProvider.getCurrentUser()
    }
}
