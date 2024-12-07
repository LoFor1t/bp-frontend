//
//  ScanCardIdButtonView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct ScanCardIdButtonView: View {
    @Binding var cardId: String
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("Card ID")
                .font(.caption)
                .foregroundColor(.black)
                .padding(.horizontal)
            Button(action: {
                print("Card ID button tapped")
            }) {
                Text(cardId.isEmpty ? "tap to scan" : cardId)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.all, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 5).stroke().foregroundStyle(.gray).opacity(0.2))
            .padding(.horizontal)
        }
    }
}

#Preview {
    ScanCardIdButtonView(cardId: .constant("012345678901234"))
}
