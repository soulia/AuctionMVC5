namespace CHSAuction.Web.DataContexts.IdentityMigrations
{
    using CHSAuction.Web.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<CHSAuction.Web.DataContexts.IdentityDb>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            MigrationsDirectory = @"DataContexts\IdentityMigrations";
        }

        protected override void Seed(CHSAuction.Web.DataContexts.IdentityDb context)
        {
            if(!context.Users.Any(u => u.UserName == "mike.soulia@gmail.com")) {
                var store = new UserStore<ApplicationUser>(context);
                var manager = new UserManager<ApplicationUser>(store);
                var user = new ApplicationUser { UserName = "mike.soulia@gmail.com" };

                manager.Create(user, "$ammy101");
            }
        }
    }
}
