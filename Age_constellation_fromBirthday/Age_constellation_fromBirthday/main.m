//
//  main.m
//  Age_constellation_fromBirthday
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *  由生日计算出年龄，星座
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int y,m,d;
        int age;
        printf("Please enter your birthday like this :yyyy/mm/dd: \n");
        scanf("%d/%d/%d",&y,&m,&d);
        
        age=2012-(y+1);
        
        if((m>=7))
        {
            age=age+1;
        }
        printf("your age is:%d\n",age);
        return 0;
    }
    return 0;
}
