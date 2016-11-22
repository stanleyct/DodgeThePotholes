//
//  MenuScene.swift
//  DodgeThePotholes
//
//  Created by Jonathan Buie on 11/7/16.
//  Copyright © 2016 Jonathan Buie. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene{
    
    var score:Int = 0
    var gameOverLabelNode:SKLabelNode!
    var scoreLabelNode:SKLabelNode!
    var newGameButtonNode:SKSpriteNode!
    var moneyLabelNode:SKLabelNode!
    var highscoreLabelNode:SKLabelNode!
    
    var money = 0
    var previousHighscore = 0
    
    override func didMove(to view: SKView) {
        
        
        gameOverLabelNode = self.childNode(withName: "gameOverLabel") as! SKLabelNode!
        gameOverLabelNode.fontName = "PressStart2p"
        
        scoreLabelNode = self.childNode(withName: "scoreLabel") as! SKLabelNode!
        scoreLabelNode.fontName = "PressStart2p"
        scoreLabelNode.text = "\(score)"
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
        newGameButtonNode.texture = SKTexture(imageNamed: "newGameButton")
        
        moneyLabelNode = self.childNode(withName: "moneyLabel") as! SKLabelNode!
        moneyLabelNode.fontName = "PressStart2p"
        moneyLabelNode.text = "Money: $ \(money)"
        
        highscoreLabelNode = self.childNode(withName: "highscoreLabel") as! SKLabelNode!
        highscoreLabelNode.fontName = "PressStart2p"
        
        
        if previousHighscore < preferences.value(forKey: "highscore") as! Int{
            let flashAct = SKAction.sequence([SKAction.fadeOut(withDuration: 0.3),
                                            SKAction.fadeIn(withDuration: 0.3)])
            let flash = SKAction.repeat(flashAct, count: 30)
            highscoreLabelNode.run(flash)
            previousHighscore = preferences.value(forKey: "highscore") as! Int
        }
        else{
            highscoreLabelNode.isHidden = true
        }

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            
            let nodesArray = self.nodes(at: location)
            let transition = SKTransition.flipHorizontal(withDuration: 1.0)
            
            if nodesArray.first?.name == "newGameButton" {
                if(preferences.bool(forKey: "sfx") == true){
                    self.run(SKAction.playSoundFileNamed("start.wav", waitForCompletion: false))
                }
                let gameScene = GameScene(size: self.size)
                gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
}
