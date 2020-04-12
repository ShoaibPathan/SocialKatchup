//
//  LoginViewModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    
    @Published var isValidFields: Bool = false
    
    @Published var isLogged = false

    private var isValidFieldsPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(self.$email, self.$password)
            .receive(on: RunLoop.main)
            .map { info -> Bool in
                return !String(info.0).isEmpty && !String(info.1).isEmpty
        }
        .eraseToAnyPublisher()
    }
    
    private var cancellableSet: Set<AnyCancellable> = []

    init() {

        isValidFieldsPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValidFields, on: self).store(in: &cancellableSet)
    }

}
