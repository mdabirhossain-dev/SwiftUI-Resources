//
//  SwiftUI_ResourcesApp.swift
//  SwiftUI Resources
//
//  Created by Md Abir Hossain on 16/3/23.
//

import SwiftUI

@main
struct SwiftUI_ResourcesApp: App {
    @State private var rating = ""
    var body: some Scene {
        WindowGroup {
            SliderView(rating: $rating)
//            AsyncImageView()
        }
    }
}
