//
// 
// FileName: TextFieldsView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 11-09-2024 at 7:35 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct TextFieldsView: View {
    // MARK: - Properties
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CollapsibleSearchView()
            
            VStack {
                FloatingTitleTextField(title: "First Name", text: $firstName)
                FloatingTitleTextField(title: "Last Name", text: $lastName)
            }
            .padding(.horizontal)
        }
    }
}

struct TextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsView()
    }
}
