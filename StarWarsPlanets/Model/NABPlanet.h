//
//  NABPlanet.h
//  StarWarsPlanets
//
//  Created by Nicholas Boleky on 1/30/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NABPlanet : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *climate;
@property (nonatomic, copy, readonly) NSString *terrain;

- (instancetype)initWithName:(NSString *)name climate:(NSString *)climate terrain:(NSString *)terrain;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
