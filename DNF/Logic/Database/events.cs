//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Logic.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class events
    {
        public events()
        {
            this.materials = new HashSet<materials>();
            this.registers = new HashSet<registers>();
        }
    
        public long Id { get; set; }
        public string Nazwa { get; set; }
        public string Opis { get; set; }
        public System.DateTime Data { get; set; }
        public long IloscMiejsc { get; set; }
        public long IloscWolnych { get; set; }
        public string Miejsce { get; set; }
        public string Prowadzacy { get; set; }
        public long KategoriaWiekowa { get; set; }
    
        public virtual users users { get; set; }
        public virtual ICollection<materials> materials { get; set; }
        public virtual ICollection<registers> registers { get; set; }
    }
}
