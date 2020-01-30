//
//  NABPlanetController.h
//  StarWarsPlanets
//
//  Created by Nicholas Boleky on 1/30/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NABPlanet.h"
NS_ASSUME_NONNULL_BEGIN

@interface NABPlanetController : NSObject

+(instancetype)sharedController;

-(void)fetchPlanets:(void(^)(NSArray<NABPlanet *> *planets, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
