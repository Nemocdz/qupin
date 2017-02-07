//
//  QPNetworking.h
//  
//
//  Created by Nemocdz on 2017/1/26.
//
//

#import <Foundation/Foundation.h>

@protocol QPLoginDelegate <NSObject>

- (void)loginSucess:(NSDictionary *)userInfo;
- (void)loginFailed:(NSError *)error;

@end

@protocol QPSmsCodeDelegate <NSObject>

- (void)sendSucess:(NSDictionary *)userInfo;
- (void)sendFailed:(NSError *)error;

@end

@interface QPNetworking : NSObject

@property (nonatomic ,assign) id<QPLoginDelegate> loginDelegate;
@property (nonatomic ,assign) id<QPSmsCodeDelegate> smsCodeDelegate;


- (void)sendSmsCode:(NSDictionary *)smsInfo;
- (void)login:(NSDictionary *)userInfo;
- (void)signIn:(NSDictionary *)userInfo;
- (void)phoneLogin:(NSDictionary *)userInfo;

+ (QPNetworking *)sharedManager;

@end
