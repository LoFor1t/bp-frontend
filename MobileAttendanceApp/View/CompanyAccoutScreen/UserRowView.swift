//
//  UserRowView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct UserRowView: View {
    var employeeUsername: String
    var body: some View {
        HStack {
            Text(employeeUsername)
                .padding()
            Spacer()
            
            Button(action: {
                print("Edit button tapped for \(employeeUsername)")
            }) {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
            }
            
            Button(action: {
                print("Delete button tapped for \(employeeUsername)")
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
    UserRowView(employeeUsername: "employee name")
}
