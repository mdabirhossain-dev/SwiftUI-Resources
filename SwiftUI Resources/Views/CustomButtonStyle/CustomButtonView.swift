//
// 
// FileName: CustomButtonView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 29-08-2024 at 12:33 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct CustomButtonView: View {
    @State private var reset = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 100) {
                Button("Neumorphic Button Style") {
                    print("Neumorphic Button Style")
                }
                .buttonStyle(NeumorphicButtonStyle())
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.grayBackground.ignoresSafeArea(.all))
                
                
                Button("Pressable Button Style") {
                    print("Pressable Button Style")
                }
                .buttonStyle(PressableButtonStyle())
                
                
                LoadingButtonStyle(startTitle: "Loading", endTitle: "Success", reset: $reset, action: {
                    print("Loading Button Style")
                })
                
                
                Button("3D Button Style") {
                    print("3D Button Style")
                }
                .buttonStyle(ThreeDButtonStyle())
            }
            .padding(.top)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
