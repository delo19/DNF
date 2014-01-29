using DNF.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DNF.Controllers
{
    public class UsersController
    {
        public List<users> Zaloguj(string login, string haslo)
        {
            using (var dc = new DnfEntities())
            {
                var user = (from us in dc.users where us.Login == login && us.Haslo == haslo select us).ToList();
                return user;
            }
        }
    }
}
