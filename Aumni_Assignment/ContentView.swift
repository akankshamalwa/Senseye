//
//  ContentView.swift
//  Aumni_Assignment
//
//  Created by Akanksha Malawade on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var isClickMeButtonTapped: Bool = false
    @ObservedObject var viewModel: NicknameViewModel = NicknameViewModel()

    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white).opacity(0.9)
                    .frame(width: 380, height: 300)
                    .shadow(color: .gray, radius: 5)
                VStack(alignment: .center, spacing: 20) {
                    Text("Username")
                        .font(.title3)
                    TextField("Enter Username", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button {
                        isClickMeButtonTapped = true
                        viewModel.clickMeTapped(user: text)
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 320, height: 50)
                            .foregroundColor(.cyan)
                            .overlay(Text("Click Me!!")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.title2))
                    }

                    if isClickMeButtonTapped {
                        Text("Here is your nickname:\(viewModel.name)")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .fontWeight(.bold)
                    }

                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
