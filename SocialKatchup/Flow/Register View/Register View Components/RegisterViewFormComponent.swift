//
//  RegisterViewFormComponent.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 01.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

struct RegisterViewFormComponent: View {
    
    @Binding var backNavigationTrigger: Bool
    @ObservedObject var viewModel: RegisterViewModel

    private let singInColor = Color(red: 233.0 / 255.0, green: 68.0 / 255.0, blue: 106.0 / 255.0)
    
    var body: some View {
        VStack() {
            Spacer()
            
            ProfilePictureAddComponent(image: self.$viewModel.profileImage).padding(.bottom, 40.0)
             
            VStack(spacing: 30.0) {
                
                // - Username Field Stack
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("FULL NAME")
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 10.0))
                        .foregroundColor(.textAdditional)
                    
                    TextField("Full name", text: self.$viewModel.name)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                        .foregroundColor(.textPrimary)
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .textContentType(.username)
                }
                
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
                    Text("PASSWORD")
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 10.0))
                        .foregroundColor(.textAdditional)
                    
                    SecureField("Password", text: self.$viewModel.password)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                        .foregroundColor(.textPrimary)
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
                
                // - Buttons Stack
                VStack(alignment: .center ,spacing: 32.0) {
                    
                    Button(action: {
                        withAnimation {
                            self.viewModel.isUserRegistered.toggle()
                        }
                    }) {
                        Text("Sing up")
                            .padding(.all, 12)
                            .foregroundColor(.white)
                            .font(.custom(CustomFont.montserratMedium.rawValue, size: 16.0))
                        
                    }
                    .disabled(!self.viewModel.isValidFields)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 52.0, maxHeight: 52.0)
                        .background(self.viewModel.isValidFields ? self.singInColor : self.singInColor.opacity(0.5))
                    .cornerRadius(4.0)
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.textAdditional)
                            .font(.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                        
                        Button(action: {
                            self.backNavigationTrigger = false
                        }) {
                            Text("Sign in")
                                .foregroundColor(self.singInColor)
                                .font(.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                        }
                    }
                }
            }
            .padding(.bottom, 180.0)
            .padding(.leading, 24.0)
            .padding(.trailing, 24.0)
        }
        
    }
}

#if DEBUG
struct RegisterViewFieldsComponent_Previews: PreviewProvider {
    
    // - moked values
    @State static var isActive: Bool = false
    @ObservedObject static var viewModel = RegisterViewModel()
    
    static var previews: some View {
        RegisterViewFormComponent(
            backNavigationTrigger: $isActive,
            viewModel: viewModel
        )
    }
}
#endif
