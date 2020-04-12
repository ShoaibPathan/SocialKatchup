//
//  LoginView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 06.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    // - Internal Properties
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var registerViewModel: RegisterViewModel
    @Environment(\.localStatusBarStyle) var statusBarStyle
    
    // - Body
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                LoginBackgroundComponent()
                LoginFieldsComponent(viewModel: viewModel, registerViewModel: registerViewModel)
            }
        }.onAppear {
            self.statusBarStyle.currentStyle = .lightContent
        }.onDisappear {
            self.statusBarStyle.currentStyle = .darkContent
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(), registerViewModel: RegisterViewModel())
    }
}
