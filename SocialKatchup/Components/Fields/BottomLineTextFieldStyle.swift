//
//  BottomLineTextFieldStyle.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct BottomLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            configuration
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color.primary.opacity(0.1))
        }
    }
}

