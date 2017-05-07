using CHSAuction.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CHSAuction.Web.DataContexts
{
    public class CHSAuctionDb: DbContext
    {
        public CHSAuctionDb() : base("DefaultConnection")
        {

        }
        public DbSet<Item> Items { get; set; }
    }
}