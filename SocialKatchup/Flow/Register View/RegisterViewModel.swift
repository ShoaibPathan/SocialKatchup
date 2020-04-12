//
//  RegisterViewModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Combine
import SwiftUI

class RegisterViewModel: ObservableObject {
    
    @Published var profileImage: UIImage?
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    
    @Published var isValidFields: Bool = false
    
    @Published var isUserRegistered = false
    
    private var isValidFieldsPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(self.$email, self.$name, self.$password)
            .receive(on: RunLoop.main)
            .map { info -> Bool in
                return !String(info.0).isEmpty && !String(info.1).isEmpty && !String(info.2).isEmpty
        }
        .eraseToAnyPublisher()
    }
    
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        isValidFieldsPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValidFields, on: self)
            .store(in: &cancellableSet)
    }

}
