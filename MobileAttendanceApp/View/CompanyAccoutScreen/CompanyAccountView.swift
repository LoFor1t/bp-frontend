//
//  CompanyAccountView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct CompanyAccountView: View {
    @EnvironmentObject var companyModel: CompanyModel
    
    @State private var showNewUserOverlay = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .foregroundStyle(.blue)
                            .padding(.leading, 70)
                        Spacer()
                        VStack(alignment: .leading) {
                            Button(action: {
                                print("Add button tapped")
                            }) {
                                Image(systemName: "pencil.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 150)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    
                    Text("Count of employees: \(companyModel.employees.count)")
                        .font(.title2)
                        .padding(.top, 20)
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(companyModel.employees) { employee in
                            UserRowView(employeeUsername: employee.name)
                        }
                    }
                }
                .navigationBarBackButtonHidden(showNewUserOverlay)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                showNewUserOverlay.toggle()
                            }
                        }) {
                            if !showNewUserOverlay {
                                Text("Add new user")
                            }
                        }
                    }
                }
                
                if showNewUserOverlay {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showNewUserOverlay.toggle()
                        }
                        .overlay {
                            CreateNewUserView(companyDomains: companyModel.companyDomains, addNewUser: {newEmployee in
                                showNewUserOverlay.toggle()
                                companyModel.employees.append(newEmployee)})
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
                        }
                    
                }
            }
        }
    }
}

#Preview {
    CompanyAccountView()
        .environmentObject(CompanyModel(companyName: "LoFor1t corp", companyDomains: ["@example.com"], employees: [EmployeeModel(name: "employee 1"), EmployeeModel(name: "employee 2"), EmployeeModel(name: "employee 3"), EmployeeModel(name: "employee 4")]))
}
