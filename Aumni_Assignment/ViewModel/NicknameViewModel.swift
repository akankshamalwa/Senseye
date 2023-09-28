//
//  NicknameViewModel.swift
//  Aumni_Assignment
//
//  Created by Akanksha Malawade on 28/09/23.
//

import SwiftUI

class NicknameViewModel: ObservableObject {
    @Published var mappingName: [String:String] = [:]
    @State private var username: String?
    private var nickNames: [String] = ["Romeo", "James Bond", "Ironman", "Thor", "Hulk", "Captain America"]
    @Published private var nickName: String?
    private var shouldCapitalizedName: Bool = false
    var name: String {
        get {
            guard let name = nickName else {
                return ""
            }
            return name
        }
    }

    init() {
    }

    func clickMeTapped(user: String) {
        if let existingNickname = mappingName[user] {
            nickName = shouldCapitalizedName ? existingNickname.uppercased() : existingNickname
        } else {
            nickName = shouldCapitalizedName ? nickNames.randomElement()?.uppercased() : nickNames.randomElement()
            mappingName[user] = nickName
        }
    }
}
