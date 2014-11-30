//
//  NUSMEngine.h
//  NUSMODS-API-iOS
//
//  Created by Jiang Sheng on 30/11/14.
//  Copyright (c) 2014 Jiang Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NUSMEngineSuccessBlock)(id);
typedef void (^NUSMEngineFailureBlock)(NSError *);

@interface NUSMEngine : NSObject
/**
 Get a singleton of the api engine
 */
+(instancetype)sharedEngine;

/**
 Get all module codes in the given year and semester
 
 @param acadYear The academic year for query. E.g. "2014-2015"
 @param sem The semester for the academic year E.g. 1
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
*/
-(void)getModuleCodesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

/**
 Get all module codes with module name in the given year and semester
 
 @param acadYear The academic year for query. E.g. "2014-2015"
 @param sem The semester for the academic year E.g. 1
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getModuleListForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

/**
 Get all faculties with its department name in the given year and semester
 
 @param acadYear The academic year for query. E.g. "2014-2015"
 @param sem The semester for the academic year E.g. 1
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getFacultyAndDeptsForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

/**
 Get all lesson types
 
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getLessonTypes:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

/**
 Get one module detail in the given year and semester
 
 @param acadYear The academic year for query. E.g. "2014-2015"
 @param sem The semester for the academic year E.g. 1
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getModuleForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem WithCode:(NSString*)moduleCode success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

/**
 Get all module details in the given year and semester
 
 @param acadYear The academic year for query. E.g. "2014-2015"
 @param sem The semester for the academic year E.g. 1
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getAllModulesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;
@end
