#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    //Increment time since last obstacle added
    timeSinceObstacle += delta;
    
    //Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //add new obstacle
        [self addObstacle];
        
        //Reset timeSinceObstacle
        timeSinceObstacle = 0.0f;
    }
    
}

// put new methods here
- (void)touchBegan:(UITouch*)touch withEvent:(UIEvent *)event{
    //This will get called everytime the user touches the screen
    [character flap];
}

@end
