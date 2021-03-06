﻿using CHSAuction.Web.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CHSAuction.Web.DataContexts
{
    public class IdentityDb : IdentityDbContext<ApplicationUser>
    {
        public IdentityDb()
            : base("AzureConnection", throwIfV1Schema: false)
        {
        }

        public static IdentityDb Create()
        {
            return new IdentityDb();
        }
    }
}