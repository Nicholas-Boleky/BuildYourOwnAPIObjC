//
//  NABPlanet.m
//  StarWarsPlanets
//
//  Created by Nicholas Boleky on 1/30/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import "NABPlanet.h"

@implementation NABPlanet

-(instancetype)initWithName:(NSString *)name climate:(NSString *)climate terrain:(NSString *)terrain
{
    self = [super init];
    if (self)
    {
    _name = name;
    _climate = climate;
    _terrain = terrain;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *name = dictionary[[NABPlanet nameKey]];
    NSString *climate = dictionary[[NABPlanet climateKey]];
    NSString *terrain = dictionary[[NABPlanet terrainKey]];
    
    return [self initWithName:name climate:climate terrain:terrain];
    
}

                      
//MARK: - KEYS
+ (NSString *)nameKey
                      {
        return @"name";
    }
+(NSString *)climateKey
                      {
        return @"climate";
    }
+(NSString *)terrainKey
                      {
        return @"terrain";
    }
                      
@end
