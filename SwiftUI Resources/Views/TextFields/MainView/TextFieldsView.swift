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
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CollapsibleSearchView()
        }
    }
}

#Preview {
    TextFieldsView()
}
