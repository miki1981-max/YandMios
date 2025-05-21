//
//  BodyTempView2.swift
//  YandMios
//
//  Created by Kamila Ponomarova on 2025-05-20.
//

//
// 
//

import SwiftUI

struct Frame20View: View {
    var bodyTemperature: String // Directly taking a string now, not a binding
    @State private var notice: String = ""
    @State private var showConfirmation = false
    @State private var currentTime: String = ""
    @State private var measurementPlace: String = "Armpit" // Default measurement place

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("List of symptoms")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 100)

                VStack {
                    Text("Your Body Temperature is")
                        .font(.headline)
                        .multilineTextAlignment(.center)

                    Text(bodyTemperature)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 2)

                    Text("°C")
                        .font(.subheadline)
                }
                .padding(.vertical, 10)

                HStack {
                    Text(currentTime)
                        .font(.headline)
                        .padding()
                        .frame(width: 120, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)

                    Button("TODAY") {
                        updateCurrentTime()
                    }
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.vertical, 10)

                Text("The place of body temperature measurement")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 5)

                HStack {
                    ForEach(["Armpit", "Rectum", "Oral", "Ear Drum"], id: \.self) { place in
                        Button(place) {
                            measurementPlace = place
                        }
                        .frame(maxWidth: 140, maxHeight: 40)
                        .padding()
                        .background(measurementPlace == place ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)

                TextField("Enter notice", text: $notice)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Save") {
                    saveInformation()
                    showConfirmation = true
                }
                .alert(isPresented: $showConfirmation) {
                    Alert(title: Text("Saved"), message: Text("Your information has been saved."), dismissButton: .default(Text("OK")))
                }
                .foregroundColor(.white)
                .frame(width: 150, height: 44)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.top, 20)

                NavigationLink(destination: Frame23View()) {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
            .ignoresSafeArea()
            .onAppear {
                updateCurrentTime()
            }
        }
    }

    private func updateCurrentTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        currentTime = dateFormatter.string(from: Date())
    }

    private func saveInformation() {
        UserDefaults.standard.set(bodyTemperature, forKey: "savedBodyTemperature")
        UserDefaults.standard.set(notice, forKey: "savedNotice")
    }
}

struct Frame20View_Previews: PreviewProvider {
    static var previews: some View {
        Frame20View(bodyTemperature: "36.6")
    }
}
