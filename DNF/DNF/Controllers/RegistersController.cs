using DNF.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DNF.Controllers
{
    public class RegistersController
    {
        public List<registers> DajRegisters()
        {
            using (var dc = new DnfEntities())
            {
                var registersy = (from us in dc.registers select us).ToList();
                return registersy;
            }
        }
        public int Zarejestruj(registers reg)
        {
            using (var dc = new DnfEntities())
            {
                dc.registers.Add(reg);
                return dc.SaveChanges();
            }
        }
    }
}
