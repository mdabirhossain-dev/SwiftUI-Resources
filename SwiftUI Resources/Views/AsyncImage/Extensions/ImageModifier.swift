//
//  ImageModifier.swift
//  SwiftUI Resources
//
//  Created by Md Abir Hossain on 21/3/23.
//

import Foundation
import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .cornerRadius(50)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(Color.gray.opacity(0.5))
        
    }
}
