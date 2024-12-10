//
//  ScanCardIdButtonView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct ScanCardIdButtonView: View {
    @Binding var cardId: String

    var errorMessage: String?
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("Card ID")
                .font(.caption)
                .foregroundColor(.black)
            
            Button(action: {
                print("Card ID button tapped")
                cardId = "012345678901234"
            }) {
                Text(cardId.isEmpty ? "tap to scan" : cardId)
                    .foregroundColor(cardId.isEmpty ? .gray.opacity(0.5) : .black)
                    .padding(.all, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 5).stroke().foregroundStyle(.gray).opacity(0.2))
            
            Text(errorMessage ?? "")
                .font(.caption)
                .foregroundStyle(.red)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScanCardIdButtonView(cardId: .constant("012345678901234"), errorMessage: "Card ID can't be empty")
}
