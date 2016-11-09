//
//  TrafficCone.swift
//  DodgeThePotholes
//
//  Created by Peter Murphy on 11/8/16.
//  Copyright © 2016 Jonathan Buie. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class TrafficCone: Obstacle {
    
    override init(frameHeight: CGFloat, frameWidth: CGFloat){
        super.init(frameHeight: frameHeight, frameWidth: frameWidth)
        let thisObstacle = SKSpriteNode(imageNamed: "traffic_cone.png") //creating dummy obstacle because some methods cannot read in 'self.obstacle'
        self.node = thisObstacle
        self.randomPosition = GKRandomDistribution(lowestValue: Int(frameWidth * positionRange.trafficCone.low.rawValue) + Int(thisObstacle.size.width),highestValue: Int(frameWidth * positionRange.trafficCone.high.rawValue) - Int(thisObstacle.size.width))
        self.position = CGFloat(self.randomPosition.nextInt())
        self.node.position = CGPoint(x: self.position, y:frameHeight/2 + thisObstacle.size.height)
        self.node.physicsBody = SKPhysicsBody(rectangleOf: thisObstacle.size)
        
        self.node.physicsBody?.isDynamic =  true
        self.node.physicsBody?.categoryBitMask = obstacleBitmasks.generic.rawValue //0x1 << 1
        self.node.physicsBody?.contactTestBitMask = obstacleBitmasks.torpedo.rawValue //0x1 << 0
        self.node.physicsBody?.collisionBitMask = obstacleBitmasks.none.rawValue // 0x0
        
        self.animationDuration = 6
        self.action = SKAction.move(to: CGPoint(x: self.position, y: -frameHeight/2 - thisObstacle.size.height), duration: self.animationDuration)
    }
}
