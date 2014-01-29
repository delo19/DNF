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
        static EventsController myEvents = new EventsController();
        static RegistersController myRegisters = new RegistersController();


        #region users

        public static List<users> Zaloguj(string login, string haslo)
        {
            return myUsers.Zaloguj(login, haslo);
        }
        #endregion users


        #region events

        public static events DajWydarzenie(int id)
        {
            return myEvents.DajWydarzenie(id);
        }

        public static List<events> DajWydarzenia()
        {
            return myEvents.DajWydarzenia();
        }

        public static List<events> SzukajWydarzeniaNazwa(string nazwa)
        {
            return myEvents.SzukajWydarzeniaNazwa(nazwa);
        }

        public static List<events> SzukajWydarzeniaProwadzacy(string prowadzacy)
        {
            return myEvents.SzukajWydarzeniaProwadzacy(prowadzacy);
        }


        public static List<events> DajMojeWydarzenia()
        {
            return myEvents.DajMojeWydarzenia();
        }

        public static int DodajWydarzenie(events ev)
        {
            return myEvents.DodajWydarzenie(ev);
        }

        public static int SkasujWydarzenie(events ev)
        {
            return myEvents.SkasujWydarzenie(ev);
        }

        public static int EdytujWydarzenie(long id, events ev)
        {
            return myEvents.EdytujWydarzenie(id,ev);
        }

        #endregion events

        #region registers

        public static List<registers> DajRegisters()
        {
            return myRegisters.DajRegisters();
        }
        public static int Zarejestruj(registers reg)
        {
            return myRegisters.Zarejestruj(reg);
        }

        #endregion registers

    }
}
