//
//  MenuScene.swift
//  DodgeThePotholes
//
//  Created by Jonathan Buie on 11/7/16.
//  Copyright © 2016 Jonathan Buie. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var newGameButtonNode:SKSpriteNode!
    var settingsButtonNode:SKSpriteNode!
    var gameCenterButtonNode:SKSpriteNode!

    override func didMove(to view: SKView) {
        
        newGameButtonNode = self.childNode(withName: "NewGameButton") as! SKSpriteNode!
        settingsButtonNode = self.childNode(withName: "SettingsButton") as! SKSpriteNode!
        gameCenterButtonNode = self.childNode(withName: "GameCenterButton") as! SKSpriteNode!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "NewGameButton" {
                self.run(SKAction.playSoundFileNamed("start.wav", waitForCompletion: false))
                let transition = SKTransition.flipHorizontal(withDuration: 1.0)
                let gameScene = GameScene(size: self.size)
                gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                self.view?.presentScene(gameScene, transition: transition)
            }
        
        }
    }
}