//
//  ScoreGenerator.swift
//  run2
//
//  Created by Олеся Скидан on 09.05.2024.
//

import Foundation

class ScoreGenerator {
    
    static let sharedInstance = ScoreGenerator()
    private let defaults = UserDefaults.standard
    private init() {}
    
    static let keyHighscore = "keyHighscore"
    private let userIDKey = K.WebView.userIDKey
    private let fullrefKey = K.WebView.fullrefKey
    
    func setHighscore(_ highscore: Int) {
        UserDefaults.standard.set(highscore, forKey: ScoreGenerator.keyHighscore)
    }
    
    func getHighscore() -> Int {
        return UserDefaults.standard.integer(forKey: ScoreGenerator.keyHighscore)
    }
    
    func getUserID() -> String? {
        return defaults.string(forKey: userIDKey)
    }
    
    func setUserID(_ userID: String) {
        defaults.set(userID, forKey: userIDKey)
    }
    
    func getFullRef() -> String? {
        return defaults.string(forKey: fullrefKey)
    }
    
    func setFullRef(_ fullRef: String) {
        defaults.set(fullRef, forKey: fullrefKey)
    }
}

