//
//  Pokemon.m
//  PokeDexObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
        if (self != nil)
        {
            _pokemonName = name;
            _identifier = identifier;
            _abilities = abilities;
        }
    return self;
}

@end

@implementation Pokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray * abilitiesDict = dictionary[@"abilities"];
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    NSMutableArray<NSString *> * abilities = [NSMutableArray new];
    for (NSDictionary * dictionary in abilitiesDict)
    {
        NSDictionary * abilityDict = dictionary[@"ability"];
        NSString * abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end
