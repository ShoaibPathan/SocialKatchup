//
//  AddRoundedButton.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct AddRoundedButton: View {
    
    /// Use this value for change of circle color
    var circleColor: Color
    /// Use this value for change of circle border color
    var borderColor: Color
    
    var buttonAction: (() -> Void)?
    
    init(circleColor: Color = .redActive, borderColor: Color = .white, buttonAction: (() -> Void)? = nil) {
        self.circleColor = circleColor
        self.borderColor = borderColor
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button(
            action: buttonAction ?? {},
            label: {
                VStack {
                    Image("add")
                        .padding()
                        .foregroundColor(.white)
                        .background(circleColor)
                        .mask(Circle())
                }
                .padding(.all, 2.5)
                .background(borderColor)
                .mask(Circle())
            }
        )
    }
}

#if DEBUG
struct AddRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        AddRoundedButton()
    }
}
#endif
