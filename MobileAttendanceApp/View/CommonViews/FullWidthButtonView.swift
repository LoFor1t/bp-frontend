//
//  FullWidthButton.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 11/12/2024.
//

import SwiftUI

struct FullWidthButtonView: View {
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
    }
}

#Preview {
    FullWidthButtonView(buttonText: "Click")
}
