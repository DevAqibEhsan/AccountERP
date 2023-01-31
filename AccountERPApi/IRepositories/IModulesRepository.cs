﻿using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
    public interface IModulesRepository
    {
        public List<Modules> GetAll();

        Modules AddModule(Modules obj);

        Modules UpdateModule(Modules obj);
    }
}
