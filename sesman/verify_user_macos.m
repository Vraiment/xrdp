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

long
auth_userpass(const char *user, const char *pass, int *errorcode)
{
    return 0;
}

int
auth_start_session(long in_val, int in_display)
{
    return 0;
}

int
auth_stop_session(long in_val)
{
    return 0;
}

int
auth_end(long in_val)
{
    return 0;
}

int
auth_set_env(long in_val)
{
    return 0;
}

int
auth_check_pwd_chg(const char *user)
{
    return 0;
}

int
auth_change_pwd(const char *user, const char *newpwd)
{
    return 0;
}
