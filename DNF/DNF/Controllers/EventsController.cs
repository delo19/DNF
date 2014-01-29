using DNF.Database;
using DNF.Other;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DNF.Controllers
{
    public class EventsController
    {
        public List<events> DajWydarzenia()
        {
            using (var dc = new DnfEntities())
            {
                var wydarzenie = (from us in dc.events select us).ToList();
                return wydarzenie;
            }
        }

        public List<events> SzukajWydarzeniaNazwa(string nazwa)
        {
            using (var dc = new DnfEntities())
            {
                var wydarzenie = (from us in dc.events where us.Nazwa == nazwa select us).ToList();
                return wydarzenie;
            }
        }

        public List<events> SzukajWydarzeniaProwadzacy(string prowadzacy)
        {
            using (var dc = new DnfEntities())
            {
                var wydarzenie = (from us in dc.events where us.Prowadzacy == prowadzacy select us).ToList();
                return wydarzenie;
            }
        }

        public List<events> DajMojeWydarzenia()
        {
            return Session.zalogowanyUzytkownik.registers.Select(x=>x.events).ToList();
        }

        public events DajWydarzenie(int id)
        {
            using (var dc = new DnfEntities())
            {
                var wydarzenie = (from us in dc.events where us.Id == id select us).ToList();
                return wydarzenie.First();
            }
        }

        public int DodajWydarzenie(events ev)
        {
            using (var dc = new DnfEntities())
            {
                dc.events.Add(ev);
                return dc.SaveChanges();
            }
        }

        public int SkasujWydarzenie(events ev)
        {
            using (var dc = new DnfEntities())
            {
                dc.events.Remove(ev);
                return dc.SaveChanges();
            }
        }

        public int EdytujWydarzenie(int id, events ev)
        {
            using (var dc = new DnfEntities())
            {
                var wydarzenia = (from us in dc.events where us.Id == id select us).ToList();
                var wydarzenie =wydarzenia.First();
                wydarzenie.IloscMiejsc = ev.IloscMiejsc;
                wydarzenie.IloscWolnych = ev.IloscWolnych;
                wydarzenie.Miejsce = ev.Miejsce;
                wydarzenie.Nazwa = ev.Nazwa;
                wydarzenie.Opis = ev.Opis;
                wydarzenie.KategoriaWiekowa = ev.KategoriaWiekowa;
                wydarzenie.Data = ev.Data;
                dc.events.Add(ev);
                return dc.SaveChanges();
            }
        }
    }
}
