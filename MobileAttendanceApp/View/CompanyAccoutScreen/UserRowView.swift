//
//  UserRowView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct UserRowView: View {
    var employeeName: String
    
    var editUser: () -> Void
    var deleteUser: (String) -> Void
    
    private let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Text(employeeName)
                .padding()
            Spacer()
            
            Button(action: {
                editUser()
            }) {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
            }
            
            Button(action: {
                withAnimation {
                    deleteUser(employeeName)
                    hapticFeedback.notificationOccurred(.error)
                }
            }) {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
                    .padding(.trailing)
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).stroke())
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

#Preview {
    UserRowView(employeeName: "employee name", editUser: {
        print("Edit button tapped for")
    }, deleteUser: { employeeName in
        print("Delete button tapped for \(employeeName)")
    })
}
