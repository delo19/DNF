//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DNF
{
    using System;
    using System.Collections.Generic;
    
    public partial class register
    {
        public int Id { get; set; }
        public int Event { get; set; }
        public int UserId { get; set; }
    
        public virtual events events { get; set; }
        public virtual users users { get; set; }
    }
}