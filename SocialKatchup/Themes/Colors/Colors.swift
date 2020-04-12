//
//  Colors.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

extension Color {
    
    static var textPrimary: Color {
        return Color(red: 22.0 / 255.0, green: 31.0 / 255.0, blue: 61.0 / 255.0)
    }
    
    static var textAdditional: Color {
        return Color(red: 22.0 / 255.0, green: 31.0 / 255.0, blue: 61.0 / 255.0).opacity(0.5)
    }
    
    static var redActive: Color {
        return Color(red: 233.0 / 255.0, green: 68.0 / 255.0, blue: 106.0 / 255.0)
    }
    
    static var redDisabble: Color {
        return Color(red: 233.0 / 255.0, green: 68.0 / 255.0, blue: 106.0 / 255.0).opacity(0.3)
    }
    
    static var white10: Color {
        return Color(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0).opacity(0.1)
    }
    
    static var grayBackground: Color {
        return Color(red: 237.0 / 255.0, green: 238.0 / 255.0, blue: 245.0 / 255.0)
    }
}
