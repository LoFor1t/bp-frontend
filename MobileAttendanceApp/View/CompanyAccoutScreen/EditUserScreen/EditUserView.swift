//
//  CreateNewUserView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct EditUserView: View {
    @ObservedObject var employeeModel: EmployeeModel
    
    var buttonText: String
    var companyDomains: [String]
    
    var onEditUser: (EmployeeModel) -> Void
    
    private let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack() {
            Text("New user")
                .font(.title2)
                .padding(.top, 30)
            
            // Name field
            InputTextFieldView(fieldName: "Name", placeholder: "John Doe", errorMessage: employeeModel.nameError, fieldValue: $employeeModel.name)
            .padding(.horizontal)
            .padding(.bottom)
            
            // Email field
            InputTextFieldView(capitalizedSentences: false, fieldName: "Email", placeholder: "example@your.domain", errorMessage: employeeModel.emailError, fieldValue: $employeeModel.email)
            .padding(.horizontal)
            .padding(.bottom)
            
            ScanCardIdButtonView(cardId: $employeeModel.cardId, errorMessage: employeeModel.cardIdError)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                if (employeeModel.validate(companyDomains: companyDomains)) {
                    onEditUser(employeeModel)
                    hapticFeedback.notificationOccurred(.success)
                }
            }) {
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
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    EditUserView(employeeModel: EmployeeModel(), buttonText: "Add User", companyDomains: ["@example.com"], onEditUser: { newUser in
        print("Add new user button pressed with parameters: \(newUser.name), \(newUser.email), \(newUser.cardId)")
    })
}
