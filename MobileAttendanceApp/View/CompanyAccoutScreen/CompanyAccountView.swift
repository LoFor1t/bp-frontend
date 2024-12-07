//
//  CompanyAccountView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct CompanyAccountView: View {
    @State private var employees = ["employee 1", "employee 2", "employee 3", "employee 4"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.blue)
                            .padding(.leading, 70)
                        Spacer()
                        VStack(alignment: .leading) {
                            Button(action: {
                                print("Add button tapped")
                            }) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 150)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    
                    Text("Count of employees: \(employees.count)")
                        .font(.title2)
                        .padding(.top, 20)
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(employees, id: \.self) { employee in
                            UserRowView(employeeUsername: employee)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CompanyAccountView()
}
