//
//  NicknameViewModel.swift
//  Aumni_Assignment
//
//  Created by Akanksha Malawade on 28/09/23.
//

import SwiftUI

class NicknameViewModel: ObservableObject {

    //MARK: Published properties

    // A dictionary to store the mapping of user names to nicknames.
    @Published var mappingName: [String:String] = [:]

    // A private property to store the current nickname.
    @Published private var nickName: String?

    // A private property to store the current username.
    @State private var username: String?

    // An array of predefined nicknames.
    private var nickNames: [String] = ["Romeo", "James Bond", "Ironman", "Thor", "Hulk", "Captain America"]

    // A flag to determine if the nickname should be capitalized.
    private var shouldCapitalizedName: Bool = false

    // A computed property to get the current name.
    var name: String {
        get {
            guard let name = nickName else {
                return ""
            }
            return name
        }
    }

    // MARK: - Initializer

    init() {
    }

    // MARK: - Methods

    // Function to handle the "Click Me" button tap.
    func clickMeTapped(user: String) {
        if let existingNickname = mappingName[user] {

            // Use the existing nickname for the user.
            nickName = shouldCapitalizedName ? existingNickname.uppercased() : existingNickname
        } else {

            // Generate a random nickname for the user.
            nickName = shouldCapitalizedName ? nickNames.randomElement()?.uppercased() : nickNames.randomElement()

            // Store the mapping of the user to the generated nickname.
            mappingName[user] = nickName
        }
    }
}
