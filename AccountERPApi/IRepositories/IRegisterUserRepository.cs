﻿using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IRegisterUserRepository
    {
        object RegisterUser(RegisterUser obj);
    }
}
