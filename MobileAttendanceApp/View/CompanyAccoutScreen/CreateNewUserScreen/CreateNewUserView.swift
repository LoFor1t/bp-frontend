//
//  CreateNewUserView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct CreateNewUserView: View {
    @StateObject var userModel: EmployeeModel = EmployeeModel()
    
    var companyDomains: [String]
    
    var addNewUser: (EmployeeModel) -> Void
    
    var body: some View {
        VStack() {
            Text("New user")
                .font(.title2)
                .padding(.top, 30)
            
            // Name field
            InputTextFieldView(fieldName: "Name", placeholder: "John Doe", errorMessage: userModel.nameError, fieldValue: $userModel.name)
            .padding(.horizontal)
            .padding(.bottom)
            
            // Email field
            InputTextFieldView(capitalizedSentences: false, fieldName: "Email", placeholder: "example@your.domain", errorMessage: userModel.emailError, fieldValue: $userModel.email)
            .padding(.horizontal)
            .padding(.bottom)
            
            ScanCardIdButtonView(cardId: $userModel.cardId, errorMessage: userModel.cardIdError)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                if (userModel.validate(companyDomains: companyDomains)) {
                    addNewUser(userModel)
                }
            }) {
                Text("Add user")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    CreateNewUserView(companyDomains: ["@example.com"], addNewUser: { newUser in
        print("Add new user button pressed with parameters: \(newUser.name), \(newUser.email), \(newUser.cardId)")
    })
}
