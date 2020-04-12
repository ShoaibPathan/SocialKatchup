//
//  LoginFieldsComponent.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

// - LoginFieldsComponent
struct LoginFieldsComponent: View {
    
    // - Internal Property
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var registerViewModel: RegisterViewModel
    
    // - Private Properties
    @State private var registrationNavigation = false
    
    private let singInColor = Color(red: 233.0 / 255.0, green: 68.0 / 255.0, blue: 106.0 / 255.0)
    
    // - Bodu
    var body: some View {
        
        VStack() {
            Spacer()
            
            VStack(spacing: 30.0) {
                
                // - Email Field Stack
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("EMAIL ADRESS")
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 10.0))
                        .foregroundColor(.textAdditional)
                    
                    TextField("Email", text: self.$viewModel.email)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                        .foregroundColor(.textPrimary)
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .textContentType(.emailAddress)
                }
                
                // - Password Field Stack
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        Text("PASSWORD")
                            .font(.custom(CustomFont.montserratRegular.rawValue, size: 10.0))
                            .foregroundColor(.textAdditional)
                        
                        
                        Spacer()
                        
                        Button("forgot password", action: {})
                            .foregroundColor(.textAdditional)
                            .font(.custom(CustomFont.montserratMedium.rawValue, size: 11.0))
                    }
                    
                    SecureField("Password", text: self.$viewModel.password)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                        .foregroundColor(.textPrimary).textFieldStyle(BottomLineTextFieldStyle())
                }
                
                // - Buttons Stack
                VStack(alignment: .center ,spacing: 32.0) {
                    Button(action: {
                        withAnimation {
                            self.viewModel.isLogged.toggle()
                        }
                    }) {
                        Text("Sing in")
                            .padding(.all, 12)
                            .foregroundColor(.white)
                            .font(.custom(CustomFont.montserratMedium.rawValue, size: 16.0))
                    }
                    .disabled(!self.viewModel.isValidFields)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 52.0, maxHeight: 52.0)
                    .background(self.viewModel.isValidFields ? self.singInColor : self.singInColor.opacity(0.5))
                    .cornerRadius(4.0)
                }
                
                
                HStack {
                    Text("Don't have account?")
                        .foregroundColor(.textAdditional)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                    
                    
                    NavigationLink(destination: RegisterView(viewModel: registerViewModel, isActive: $registrationNavigation), isActive: $registrationNavigation) {
                        Button(action: {
                            self.registrationNavigation.toggle()
                        }) {
                            Text("Sign up")
                                .foregroundColor(self.singInColor)
                                .font(.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                        }
                    }
                    
                }
                
            }
        }
        .padding(.bottom, 180.0)
        .padding(.leading, 24.0)
        .padding(.trailing, 24.0)
    }
    
}


#if DEBUG
struct LoginFieldsComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoginFieldsComponent(viewModel: LoginViewModel(), registerViewModel: RegisterViewModel())
    }
}
#endif
