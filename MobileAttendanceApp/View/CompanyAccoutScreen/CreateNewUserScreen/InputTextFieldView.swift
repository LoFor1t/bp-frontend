//
//  InputTextFieldView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct InputTextFieldView: View {
    var fieldName: String
    var placeholder: String
    var errorMessage: String?
    
    @Binding var fieldValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .font(.caption)
                .foregroundColor(.black)
            TextField("\(placeholder)", text: $fieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(errorMessage ?? "")
                .font(.caption)
                .foregroundStyle(.red)
        }
        .padding(.horizontal)
    }
}

#Preview {
    InputTextFieldView(fieldName: "Name", placeholder: "John Doe", errorMessage: "Please enter your name", fieldValue: .constant("Jozko Mrkvicka"))
}
