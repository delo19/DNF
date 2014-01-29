using DNF.Controllers;
using DNF.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DNF.Other
{
    public static class ManagerLogic
    {
        static UsersController myUsers = new UsersController();




        #region users

        public static List<users> Zaloguj(string login, string haslo)
        {
            return myUsers.Zaloguj(login, haslo);
        }
        #endregion users
    }
}
