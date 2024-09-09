//
// 
// FileName: CustomButtonStyle.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 29-08-2024 at 12:34 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Neumorphic Button Style
struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(
                    Color.grayBackground
                        .shadow(.inner(color: Color.black.opacity(configuration.isPressed ? 0.15 : 0), radius: 10, x: 4, y: 4))
                        .shadow(.inner(color: Color.white.opacity(configuration.isPressed ? 1 : 0), radius: 10, x: -10, y: -10))
                )
            
            configuration.label.font(.title3)
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
        .frame(width: 300, height: 60)
        .background(
            Color.grayBackground
                .shadow(.drop(color: Color.white.opacity(configuration.isPressed ? 0 : 1), radius: 10, x: 0, y: -10))
                .shadow(.drop(color: Color.black.opacity(configuration.isPressed ? 0 : 0.15), radius: 10, x: 15, y: 5))
            , in: .rect(cornerRadius: 12)
        )
        .animation(.none, value: configuration.isPressed)
    }
}

// MARK: - Pressable Button Style
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 306, height: configuration.isPressed ? 64 : 68)
                .foregroundStyle(.black)
                .offset(y: configuration.isPressed ? 0.2 : 3)
            
            configuration.label.font(.title3).bold()
                .offset(y: configuration.isPressed ? -0.5 : 0)
                .foregroundColor(configuration.isPressed ? .white : .black)
                .frame(width: 300, height: 60)
                .background(configuration.isPressed ? .cyan : .pink.opacity(0.8), in: .rect(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.white)
                }
        }
        .animation(.spring, value: configuration.isPressed)
    }
}


// MARK: - Loading Button Style
struct LoadingButtonStyle: View {
    // MARK: - Properties
    @State var spin = false
    @State var isPressed = false
    @State var next: CGFloat = 73
    @State var hasBeenPressed = false
    let startTitle: String
    let endTitle: String
    @Binding var reset: Bool
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        TextAnimation(startTitle: startTitle, endTitle: endTitle, next: $next, spin: $spin)
            .frame(width: 300, height: 60)
            .clipped()
            .background(.primary, in: .rect(cornerRadius: 12))
            .scaleEffect(isPressed ? 1.1 : 1)
            .animation(.spring, value: isPressed)
            .animation(.spring(duration: 1), value: next)
            .gesture(dragGesture())
    }
    
    func dragGesture() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                isPressed = true
            }
            .onEnded { _ in
                action()
                isPressed = false
                if !hasBeenPressed {
                    hasBeenPressed = true
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        spin = true
                    }
                    next -= 73
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        next -= 73
                    }
                }
            }
    }
}

struct TextAnimation: View {
    // MARK: - Properties
    var startTitle: String
    var endTitle: String
    @Binding var next: CGFloat
    @Binding var spin: Bool
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 50) {
            Text(endTitle)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(lineWidth: 3)
                .frame(width: 25, height: 25)
                .rotationEffect(.degrees(spin ? 360 : 0))
            
            Text(startTitle)
        }
        .bold()
        .foregroundStyle(.gray)
        .offset(y: -next)
    }
}



// MARK: - 3D Button Style
struct ThreeDButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            let offset: CGFloat = 8
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(Color(red: 62/255, green: 87/255, blue: 178/255))
                .offset(y: offset)
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(Color(red: 123/255, green: 152/255, blue: 255/255))
                .offset(y: configuration.isPressed ? offset : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .compositingGroup()
        .shadow(radius: 6, y: 4)
        .frame(width: 300, height: 60)
    }
}


// MARK: - Gradient Button Style
struct GradientButtonStyle: ButtonStyle {
    let gradient = Gradient(colors: [.pink, .purple, .blue, .green, .yellow, .orange, .red])
    @State private var isAnimating = false
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(AngularGradient.init(gradient: gradient, center: .center, angle: .degrees(isAnimating ? 360 : 0)), lineWidth: 14)
                .frame(width: 210, height: 30)
                .offset(y: 30)
                .blur(radius: 30)
            
            configuration.label
                .bold()
                .foregroundStyle(.white)
                .frame(width: 280, height: 60)
                .background(Color.gradientButtonBackground, in: .rect(cornerRadius: 20))
                .overlay (
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AngularGradient.init(gradient: gradient, center: .center, angle: .degrees(isAnimating ? 360 : 0)), lineWidth: 3)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundStyle(LinearGradient(colors: [.black, .black, .clear], startPoint: .top, endPoint: .bottom))
                    }
                )
        }
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .animation(.spring, value: configuration.isPressed)
        .onAppear(perform: {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                isAnimating = true
            }
        })
    }
}


struct CustomButtonView1_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
