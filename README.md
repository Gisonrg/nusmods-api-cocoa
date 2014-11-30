A cocoa wrapper for NUSMods API
=================

A simple Cocoa wrapper for the [NUSMODS API][1] - for iOS and Mac OS X projects.

**Current Version: 0.1**

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

###API Example
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

// Get single module details in the given year and semester
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
Get all module codes in the given academic year and semester.
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
Get all module codes with module name in the given academic year and semester.
```objective-c
[engine getModuleListForAcadYear:@"2014-2015" Semester:1 success:^(id response) {
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

####Faculty and Departments
Get all faculties with its department name in the given academic year and semester.
```objective-c
[engine getFacultyAndDeptsForAcadYear:@"2014-2015" Semester:1 success:^(id response) {
    NSLog(@"%@", response);
} failure:^(NSError * error) {
    NSLog(@"%@", error);
}];
```
response: a NSDictionary object. The key is the faculty title, and the value is its department.
```objective-c
{
    "Arts & Social Sciences" =     (
    "Centre For Language Studies",
    "Chinese Studies",
    "Communications And New Media",
    "Dean's Office (Arts & Social Sc.)",
    ...
}
```

####Lesson Type
Get all lesson types. This API call is not constrained to a specific academic year or semester.
```objective-c
[engine getLessonTypes:^(id response) {
    NSLog(@"%@", response);
} failure:^(NSError * error) {
    NSLog(@"%@", error);
}];
```
response: a NSDictionary object. The key is the type description, and the value is its type.
```objective-c
{
    "DESIGN LECTURE" = Tutorial;
    "ENSEMBLE TEACHING" = Tutorial;
    LABORATORY = Tutorial;
    ...
}
```

####Module details
Get single module details in the given academic year and semester.
```objective-c
[engine getModuleForAcadYear:@"2014-2015" Semester:1 WithCode:@"CS2010" success:^(id response) {
    NSLog(@"%@", response);
} failure:^(NSError * error) {
    NSLog(@"%@", error);
}];
```
response: a NSDictionary object. The key is an end point for the module (e.g. Title, ModuleCredit...).
```objective-c
{
	...
	ModuleTitle = "Data Structures and Algorithms II";
    Preclusion = "CG1102, CS1102, CS1102C, CS1102S, CS2020";
    Prerequisite = "CS1020 or CS1020E or CG1103 Data Structures and Algorithms I";
	...
}
```

####All modules
Get all module details in the given year and semester.

**Becareful! The data set for this method is big!**

```objective-c
[engine getAllModulesForAcadYear:@"2014-2015" Semester:1 success:^(id response) {
    NSLog(@"%@", response);
} failure:^(NSError * error) {
    NSLog(@"%@", error);
}];
```
response: an NSArray of NSDictionary object. Each entry is one module details.
```objective-c
{
	...
	ModuleTitle = "Data Structures and Algorithms II";
    Preclusion = "CG1102, CS1102, CS1102C, CS1102S, CS2020";
    Prerequisite = "CS1020 or CS1020E or CG1103 Data Structures and Algorithms I";
	...
}
```

---
###Todo
+	Implement error handling. Currently we assume every operation is valid and safe.
+	Try add some meaning APIs. (While the API design is still based on the NUSMods API).
+	An iOS example app?

Please feel free to fork or create issues. This is actually my first-time writing an API in Objective-C so it would be great if we can improve it together :-).

---
###License
Licensed under the [MIT license][3].

  [1]: https://github.com/nusmodifications/nusmods-api
  [2]: https://github.com/nusmodifications/nusmods-api/blob/master/README.md
  [3]: http://opensource.org/licenses/MIT
