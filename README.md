A cocoa wrapper for NUSMods API
=================

A simple Cocoa wrapper for the [NUSMODS API][1] - for iOS and Mac OS X projects.

---
###Disclaim
This repo is not maintained by the creator of NUSMods.

NUSMods API repository: [https://github.com/nusmodifications/nusmods-api][1].

---
###Installation
Just clone this repository and drag NUSMEngine.h and NUSMEngine.m into your project, and then import the header file
```objective-c
	#import "NUSMEngine.h"
```	
###Usage
Get an instance of the engine first.
```objective-c
	NUSMEngine * engine = [NUSMEngine sharedEngine];
```		

###Endpoints
Currently, 6 APIs are provided as follow:

```objective-c
// Get all module codes in the given year and semester
-(void)getModuleCodesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

// Get all module codes with module name in the given year and semester
-(void)getModuleListForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

// Get all faculties with its department name in the given year and semester
-(void)getFacultyAndDeptsForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

// Get all lesson types
-(void)getLessonTypes:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

// Get one module detail in the given year and semester
-(void)getModuleForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem WithCode:(NSString*)moduleCode success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;

// Get all module details in the given year and semester
-(void)getAllModulesForAcadYear:(NSString *)acadYear Semester:(NSInteger)sem success:(NUSMEngineSuccessBlock)successBlock failure:(NUSMEngineFailureBlock)failureBlock;
```

When the data loaded successfully, `successBlock` will be executed; otherwise, the `failureBlock` will be executed. They are defined as followed
```objective-c
	typedef void (^NUSMEngineSuccessBlock)(id);
	typedef void (^NUSMEngineFailureBlock)(NSError *);
```

Since the return data type is `id`, you should cast it into `NSArray` or `NSDictionary` accordingly. You could define your own handler inside each block. 

All the methods are based on the current NUSMods API design. Please refer to the [NUSMods API's README][1] for more details and examples.

####Module codes
Get all module codes in the given year and semester.
```objective-c
	[engine getModuleCodesForAcadYear:@"2014-2015" Semester:1 success:^(id response) {
        NSLog(@"%@", response);
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
    }];
```
response: a NSArray object consists of different module codes.
```objective-c
	(
    ACC1002,
    ACC1002X,
    ACC2002,
    ACC3601,
    ...
    )
```

####Module codes
Get all module codes in the given year and semester.
```objective-c
	[engine getModuleCodesForAcadYear:@"2014-2015" Semester:1 success:^(id response) {
        NSLog(@"%@", response);
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
    }];
```
response: a NSDictionary object. The key is the module code, and the value is its title.
```objective-c
	{
    ACC1002 = "Financial Accounting";
    ACC1002X = "Financial Accounting";
    ACC2002 = "Managerial Accounting";
    ACC3601 = "Corporate Accounting and Reporting";
    ...
    }
```

  [1]: https://github.com/nusmodifications/nusmods-api
  [2]: https://github.com/nusmodifications/nusmods-api/blob/master/README.md
  
