//
//  ZYUserDataCenter.m
//  ZYMobMall
//
//  Created by barfoo2 on 13-8-27.
//  Copyright (c) 2013年 ZYProSoft. All rights reserved.
//

#import "ZYUserDataCenter.h"
#import "ZYPictureModel.h"

@implementation ZYUserDataCenter

- (void)startLoginWithName:(NSString *)loginName withPassword:(NSString *)password
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:loginName forKey:@"loginName"];
    [params setObject:password forKey:@"password"];
    
     [[BFNetWorkHelper shareHelper]requestDataWithApplicationType:ZYCMSRequestTypeLogin withParams:params withHelperDelegate:self withSuccessRequestMethod:@"loginSuccess:" withFaildRequestMethod:@"loginFaild:"];
}

- (void)startRigistWithName:(NSString *)loginName withPassword:(NSString *)password
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:loginName forKey:@"loginName"];
    [params setObject:password forKey:@"password"];
    
    [[BFNetWorkHelper shareHelper]requestDataWithApplicationType:ZYCMSRequestTypeRigist withParams:params withHelperDelegate:self withSuccessRequestMethod:@"rigistSuccess:" withFaildRequestMethod:@"rigistFaild:"];
}

- (void)loginSuccess:(NSDictionary*)resultDict
{
    if ([BFNetWorkHelper checkResultSuccessed:resultDict]) {
        
        if ([self.actionsDict objectForKey:@"loginSuccess"]) {
            
            LoginSuccessAction loginSuccessAction = [self.actionsDict objectForKey:@"loginSuccess"];
            loginSuccessAction();
        }
        
    }else{
        
        if ([self.actionsDict objectForKey:@"loginFaild"]) {
            
            NSString *errorMsg = [resultDict objectForKey:@"msg"];
            
            LoginFaildAction faildAction = [self.actionsDict objectForKey:@"loginFaild"];
            faildAction(errorMsg);

        }
                
    }
}
- (void)loginFaild:(NSDictionary*)resultDict
{
    if ([self.actionsDict objectForKey:@"loginFaild"]) {
                
        LoginFaildAction faildAction = [self.actionsDict objectForKey:@"loginFaild"];
        faildAction(NetWorkError);
        
    }
}

- (void)rigistSuccess:(NSDictionary*)resultDict
{
    if ([BFNetWorkHelper checkResultSuccessed:resultDict]) {
        
        if ([self.actionsDict objectForKey:@"rigistSuccess"]) {
            
            RigistSuccessAction rigistAction = [self.actionsDict objectForKey:@"rigistSuccess"];
            rigistAction();
        }
        
    }else{
       
        if ([self.actionsDict objectForKey:@"rigistFaild"]) {
            
            NSString *errMsg = [resultDict objectForKey:@"msg"];
            RigistFaildAction rigistFaild = [self.actionsDict objectForKey:@"rigistFaild"];
            rigistFaild(errMsg);
        }
    }
}

- (void)rigistFaild:(NSDictionary*)resultDict
{
    if ([self.actionsDict objectForKey:@"rigistFaild"]) {
        
        RigistFaildAction rigistFaild = [self.actionsDict objectForKey:@"rigistFaild"];
        rigistFaild(NetWorkError);
    }
}

- (void)startGetUserPicFavListWithPageIndex:(NSInteger)pageIndex
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:ZYListPageSize] forKey:@"pageSize"];
    [params setObject:[NSNumber  numberWithInt:pageIndex] forKey:@"pageIndex"];
    
    [[BFNetWorkHelper shareHelper]requestDataWithApplicationType:ZYCMSRequestTypeUserPictureFavoriteList withParams:params withHelperDelegate:self withSuccessRequestMethod:@"getUserPicFavListSuccess:" withFaildRequestMethod:@"getUserPicFavListFaild:"];
}
- (void)getUserPicFavListSuccess:(NSDictionary*)resultDict
{
    if ([BFNetWorkHelper checkResultSuccessed:resultDict]) {
        
        NSArray *resultArray = [resultDict objectForKey:@"data"];
        
        if ([self.actionsDict objectForKey:@"picFavSuccess"]) {
            
            GetUserPicFavSuccessAction successAction = [self.actionsDict objectForKey:@"picFavSuccess"];
            
            NSMutableArray *modelArray = [NSMutableArray array];
            for (int i=0; i<resultArray.count; i++) {
                
                ZYPictureModel *pictureModel = [[ZYPictureModel alloc]initWithSummaryDict:[resultArray objectAtIndex:i]];
                [modelArray addObject:pictureModel];
                [pictureModel release];
            }
            
            successAction(modelArray);
        }
        
    }else{
        
        if([self.actionsDict objectForKey:@"picFavFaild"]){
            
            NSString *errMsg = [resultDict objectForKey:@"msg"];
            
            GetUserPicFavFaildAction faildAction = [self.actionsDict objectForKey:@"picFavFaild"];
            
            faildAction(errMsg);
        }
    }
}
- (void)getUserPicFavListFaild:(NSDictionary*)resultDict
{
    if([self.actionsDict objectForKey:@"picFavFaild"]){
        
        GetUserPicFavFaildAction faildAction = [self.actionsDict objectForKey:@"picFavFaild"];
        
        faildAction(NetWorkError);
    }
}

- (void)setLoginSuccessAction:(LoginSuccessAction)successAction
{
    LoginSuccessAction loginSuccessAction = [successAction copy];
    [self.actionsDict setObject:loginSuccessAction forKey:@"loginSuccess"];
    [loginSuccessAction release];
    
}
- (void)setLoginFaildAction:(LoginFaildAction)faildAction
{
    LoginFaildAction loginFaildAction = [faildAction copy];
    [self.actionsDict setObject:loginFaildAction forKey:@"loginFaild"];
    [loginFaildAction release];
}

- (void)setRigistSuccessAction:(RigistSuccessAction)successAction
{
    RigistSuccessAction rigistSuccessAction = [successAction copy];
    [self.actionsDict setObject:rigistSuccessAction forKey:@"rigistSuccess"];
    [rigistSuccessAction release];
}
- (void)setRigistFaildAction:(RigistFaildAction)faildAction
{
    RigistSuccessAction rigistFaildAction = [faildAction copy];
    [self.actionsDict setObject:rigistFaildAction forKey:@"rigistFaild"];
    [rigistFaildAction release];
}

- (void)setGetuserPicFavSuccessAction:(GetUserPicFavSuccessAction)successAction
{
    GetUserPicFavSuccessAction rigistSuccessAction = [successAction copy];
    [self.actionsDict setObject:rigistSuccessAction forKey:@"picFavSuccess"];
    [rigistSuccessAction release];
}
- (void)setGetuserPicFavFaildAction:(GetUserPicFavFaildAction)faildAction
{
    GetUserPicFavFaildAction rigistFaildAction = [faildAction copy];
    [self.actionsDict setObject:rigistFaildAction forKey:@"picFavFaild"];
    [rigistFaildAction release];
}

@end
