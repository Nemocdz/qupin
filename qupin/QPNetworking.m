//
//  QPNetworking.m
//  
//
//  Created by Nemocdz on 2017/1/26.
//
//

#import "QPNetworking.h"
#import <AFNetworking/AFNetworking.h>

static NSString *const loginUrl = @"https://api.leancloud.cn/1.1/login";
static NSString *const userByPhoneUrl = @"https://api.leancloud.cn/1.1/usersByMobilePhone";
static NSString *const smsCodeUrl = @"https://api.leancloud.cn/1.1/requestSmsCode";

@interface QPNetworking()
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation QPNetworking

+ (QPNetworking *)sharedManager{
    return [QPNetworking sharedInstance];
}

+ (instancetype)sharedInstance{
    static QPNetworking *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        instance.manager = [self mangerWithConfig];
    });
    return instance;
}


+ (AFHTTPSessionManager *)mangerWithConfig{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"4IH7mBWQiUNHLFk0EM64xzM6-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
    [manager.requestSerializer setValue:@"1e3Om7o0ParIK1YIIqhb7gQp" forHTTPHeaderField:@"X-LC-Key"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    return manager;
}

- (void)login:(NSDictionary *)userInfo{
    [self login:userInfo url:loginUrl];
}

- (void)phoneLogin:(NSDictionary *)userInfo{
    [self login:userInfo url:userByPhoneUrl];
}

- (void)signIn:(NSDictionary *)userInfo{
    [self login:userInfo url:userByPhoneUrl];
}

- (void)sendSmsCode:(NSDictionary *)smsInfo{
    [self post:smsCodeUrl parameters:smsInfo delegate:self.smsCodeDelegate success:@selector(sendSucess:) failed:@selector(sendFailed:)];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters delegate:(id)delegate success:(SEL)success failed:(SEL)failed{
    [self.manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([delegate respondsToSelector:success]) {
            [delegate performSelector:success];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([delegate respondsToSelector:failed]) {
            [delegate performSelector:failed];
        }
    }];
}

- (void)login:(NSDictionary *)userInfo url:(NSString *)url{
    [self post:url parameters:userInfo delegate:self.loginDelegate success:@selector(loginSucess:) failed:@selector(loginFailed:)];
//    [self.manager POST:url parameters:userInfo progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if ([self.loginDelegate respondsToSelector:@selector(loginSucess:)]) {
//            [self.loginDelegate loginSucess:responseObject];
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if ([self.loginDelegate respondsToSelector:@selector(loginFailed:)]) {
//            [self.loginDelegate loginFailed:error];
//        }
//    }];
}

@end
