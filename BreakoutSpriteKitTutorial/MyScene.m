//
//  MyScene.m
//  BreakoutSpriteKitTutorial
//
//  Created by Jesus Magana on 7/6/14.
//  Copyright (c) 2014 ZeroLinux5. All rights reserved.
//

#import "MyScene.h"

static NSString* ballCategoryName = @"ball";
static NSString* paddleCategoryName = @"paddle";
static NSString* blockCategoryName = @"block";
static NSString* blockNodeCategoryName = @"blockNode";

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"bg.png"];
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addChild:background];
        
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        
        // 1 Create a physics body that borders the screen
        SKPhysicsBody* borderBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        // 2 Set physicsBody of scene to borderBody
        self.physicsBody = borderBody;
        // 3 Set the friction of that physicsBody to 0
        self.physicsBody.friction = 0.0f;
        
        // 1
        SKSpriteNode* ball = [SKSpriteNode spriteNodeWithImageNamed: @"ball.png"];
        ball.name = ballCategoryName;
        ball.position = CGPointMake(self.frame.size.width/3, self.frame.size.height/3);
        [self addChild:ball];
        
        // 2
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
        // 3
        ball.physicsBody.friction = 0.0f;
        // 4
        ball.physicsBody.restitution = 1.0f;
        // 5
        ball.physicsBody.linearDamping = 0.0f;
        // 6
        ball.physicsBody.allowsRotation = NO;
        
        [ball.physicsBody applyImpulse:CGVectorMake(10.0f, -10.0f)];
    }
    return self;
}

@end
