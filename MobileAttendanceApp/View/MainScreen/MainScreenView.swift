//
//  MainScreenView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct MainScreenView: View {
    @State private var isVisibleAttendanceOverlay: Bool = false
    
    private let hapticFeedback = UINotificationFeedbackGenerator()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        NavigationLink(destination: CompanyAccountView()) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)
                                .padding(.leading, 20)
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            isVisibleAttendanceOverlay.toggle()
                            hapticFeedback.notificationOccurred(.success)
                        }
                        print("tap to scan check")
                    }) {
                        Text("Tap to Scan")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(.bottom, 80)
                    }
                    
                    Spacer()
                }
                .disabled(isVisibleAttendanceOverlay)
                
                if isVisibleAttendanceOverlay {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isVisibleAttendanceOverlay = false
                            }
                        }
                        .overlay {
                            Text("Attendance saved successfully")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        withAnimation {
                                            isVisibleAttendanceOverlay = false
                                        }
                                    }
                                }
                        }
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
