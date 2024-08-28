//
//  ContentView.swift
//  SwiftUI Resources
//
//  Created by Md Abir Hossain on 16/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = "2.0"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 36) {
                NavigationLink(destination: SliderView(value: $sliderValue)) {
                    Text("Slider")
                }
                
                NavigationLink(destination: CustomButtonView()) {
                    Text("Custom Button Style")
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
