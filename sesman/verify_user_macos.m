/**
 * xrdp: A Remote Desktop Protocol server.
 *
 * Copyright (C) Vraiment 2018
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 *
 * @file verify_user_macos.c
 * @brief Authenticate user using mac OS' Collaboration framework
 * @author Vraiment
 *
 */

#if defined(HAVE_CONFIG_H)
#include <config_ac.h>
#endif

#import <Foundation/Foundation.h>
#import <Collaboration/Collaboration.h>

/*
 * References for collaboration framework:
 *     Framework API: https://developer.apple.com/documentation/collaboration?language=objc
 *     CBIdentityAuthority: https://developer.apple.com/documentation/collaboration/cbidentityauthority?language=objc
 *     CBIdentity: https://developer.apple.com/documentation/collaboration/cbidentity?language=objc
 *     CBUserIdentity: https://developer.apple.com/documentation/collaboration/cbuseridentity?language=objc#topics
 */

long
auth_userpass(const char *user, const char *pass, int *errorcode)
{
    NSStringEncoding encoding;
    NSString *user_name;
    NSString *password;
    CBIdentityAuthority *identity_authority;
    CBIdentity *identity;
    CBUserIdentity *user_identity;

    encoding = [NSString defaultCStringEncoding];
    user_name = [NSString stringWithCString:user encoding:encoding];
    password = [NSString stringWithCString:pass encoding:encoding];

    /*
     * If the identity should be grabed for network (like LDAP)
     */
    identity_authority = [CBIdentityAuthority localIdentityAuthority];
    identity = [CBIdentity identityWithName:user_name
                           authority:identity_authority];
    if (identity == nil || ![identity isKindOfClass:[CBUserIdentity class]])
    {
        return 0;
    }

    user_identity = (CBUserIdentity *) identity;
    return user_identity.isEnabled &&
        [user_identity authenticateWithPassword:password];
}

int
auth_start_session(long in_val, int in_display)
{
    /* NOOP */
    return 0;
}

int
auth_stop_session(long in_val)
{
    /* NOOP */
    return 0;
}

int
auth_end(long in_val)
{
    /* NOOP */
    return 0;
}

int
auth_set_env(long in_val)
{
    /* NOOP */
    return 0;
}

/* Not used */
int
auth_check_pwd_chg(const char *user);

/* Not used */
int
auth_change_pwd(const char *user, const char *newpwd);
