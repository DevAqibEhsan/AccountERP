﻿using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
    public interface IModulesService
    {
        public List<Modules> GetAll();

        public List<Modules> GetAllActive();

        Modules AddModule(Modules obj);

        Modules UpdateModule(Modules obj);

        Modules GetModuleByID(int id);
    }
}
