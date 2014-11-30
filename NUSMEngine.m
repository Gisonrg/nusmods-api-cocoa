//
//  NUSMEngine.m
//  NUSMODS-API-iOS
//
//  Created by Jiang Sheng on 30/11/14.
//  Copyright (c) 2014 Jiang Sheng. All rights reserved.
//

#import "NUSMEngine.h"

#define API_PROTOCOL @"http://"
#define API_DOMAIN @"api.nusmods.com"

#define CURRENT_AY @"2014-2015"
#define CURRENT_SEM 1

@interface NUSMEngine()
-(void)getDataFrom:(NSString *)path success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;
@end


@implementation NUSMEngine
#pragma mark Setup
+(instancetype)sharedEngine{
    static NUSMEngine *sharedEngine = nil;
    
    if (!sharedEngine) {
        sharedEngine = [[self alloc] init];
    }
    return sharedEngine;
}

#pragma mark Request Management
/**
 Send HTTP GET request to the api.nusmods.com, and retrieve requested data
 
 @param successBlock A block object to be executed when the data loaded successfully.
 @param failureBlock A block object to be executed when the task finishes unsuccessfully.
 */
-(void)getDataFrom:(NSString *)path success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // generate the api address
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@/%@", API_PROTOCOL, API_DOMAIN, path];
    NSURL *url = [NSURL URLWithString:urlString];
    // Send an HTTP GET method
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30];
    
    NSOperationQueue *queue =[[NSOperationQueue alloc] init];
    // Async request
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *rawData, NSError *error){
        if (error)
        {
            failureBlock(error);
            return;
        }
        NSData * data = (NSData *)rawData;
        id parse_result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        successBlock(parse_result);
    }];
}

#pragma mark API implement
-(void)getModuleCodesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // GET /<AcadYear>/<Semester>/moduleCodes.json
    NSString *semString = [NSString stringWithFormat: @"%ld", (long)sem];
    [self getDataFrom:[NSString stringWithFormat:@"%@/%@/moduleCodes.json", acadYear, semString] success:successBlock failure:failureBlock];
}

-(void)getModuleListForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // GET /<AcadYear>/<Semester>/moduleList.json
    NSString *semString = [NSString stringWithFormat: @"%ld", (long)sem];
    [self getDataFrom:[NSString stringWithFormat:@"%@/%@/moduleList.json", acadYear, semString] success:successBlock failure:failureBlock];
}

-(void)getFacultyAndDeptsForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // GET /<AcadYear>/<Semester>/facultyDepartments.json
    NSString *semString = [NSString stringWithFormat: @"%ld", (long)sem];
    [self getDataFrom:[NSString stringWithFormat:@"%@/%@/facultyDepartments.json", acadYear, semString] success:successBlock failure:failureBlock];
}

-(void)getLessonTypes:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // GET /lessonTypes.json
    [self getDataFrom:[NSString stringWithFormat:@"lessonTypes.json"] success:successBlock failure:failureBlock];
}

-(void)getModuleForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem WithCode:(NSString*)moduleCode success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    //    GET /<AcadYear>/<Semester>/modules/<ModuleCode>.json
    NSString *semString = [NSString stringWithFormat: @"%ld", (long)sem];
    [self getDataFrom:[NSString stringWithFormat:@"%@/%@/modules/%@.json", acadYear, semString, moduleCode] success:successBlock failure:failureBlock];
}

-(void)getAllModulesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock {
    // GET /<AcadYear>/<Semester>/modules.json
    NSString *semString = [NSString stringWithFormat: @"%ld", (long)sem];
    [self getDataFrom:[NSString stringWithFormat:@"%@/%@/modules.json", acadYear, semString] success:successBlock failure:failureBlock];
}
@end
