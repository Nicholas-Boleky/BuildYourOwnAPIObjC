//
//  NABPlanetController.m
//  StarWarsPlanets
//
//  Created by Nicholas Boleky on 1/30/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import "NABPlanetController.h"
#import "NABPlanet.h"

@implementation NABPlanetController

+(instancetype)sharedController
{
    static NABPlanet *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NABPlanetController alloc] init];
    });
    return sharedInstance;
}

//MARK: - PROPERTIES

-(NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://swapi.co/api"];
}
-(NSString *)planetComponent
{
    return @"planets";
}

//MARK: - FETCH
-(void)fetchPlanets:(void (^)(NSArray<NABPlanet *> * _Nullable, NSError * _Nullable))completion
{
    NSURL *planetArrayURL = [self baseURL];
    planetArrayURL = [planetArrayURL URLByAppendingPathComponent:[self planetComponent]];
    NSLog(@"%@", planetArrayURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:planetArrayURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        if (!data) {
            NSLog(@"Error: no data returned from task");
            completion(nil, error);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSONDictionary is not dictionary class");
            completion(nil, error);
            return;
        }

        
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *planetsArray =[NSMutableArray array];
        for(NSDictionary *dataDictionary in resultsArray) {
            NABPlanet *planet = [[NABPlanet alloc] initWithDictionary:dataDictionary];
            [planetsArray addObject:planet];
        }
        completion(planetsArray, nil);
    }]resume];
}





@end
