//
//  ContentView.swift
//  Aumni_Assignment
//
//  Created by Akanksha Malawade on 28/09/23.
//

import SwiftUI

struct ContentView: View {

    // MARK: Properties

    // State property to store the text entered by the user.
    @State private var text: String = ""

    // State property to track whether the "Click Me" button is tapped.
    @State private var isClickMeButtonTapped: Bool = false

    // Observed object for the view model.
    @ObservedObject var viewModel: NicknameViewModel = NicknameViewModel()

    var body: some View {
        ZStack {
            containerView
            cellView
        }
        .padding()
    }

    var cellView: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Username")
                .font(.title3)

            // Text field for entering the username.
            TextField("Enter Username", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // "Click Me" button.
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

                // Display the user's nickname if the button is tapped.
                Text("Here is your nickname:\(viewModel.name)")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .fontWeight(.bold)
            }

        }
    }

    var containerView: some View {

        // Container view with rounded corners and shadow.
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white).opacity(0.9)
            .frame(width: 380, height: 300)
            .shadow(color: .gray, radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
