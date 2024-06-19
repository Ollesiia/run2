//
//  SKAction+Ext.swift
//  run
//
//  Created by Олеся Скидан on 07.05.2024.
//

import SpriteKit

extension SKAction {
    
    class func playSoundFileNamed(_ fileNamed: String) -> SKAction {
        if !effectEnabled { return SKAction() }
        return SKAction.playSoundFileNamed(fileNamed, waitForCompletion: false)
    }
}

private let keyEffect = "keyEffect"
var effectEnabled: Bool = {
    return UserDefaults.standard.bool(forKey: keyEffect)
}() {
    didSet {
        let value = !effectEnabled
        UserDefaults.standard.setValue(value, forKey: keyEffect)
        
        if value {
            SKAction.stop()
        }
    }
}

