using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CHSAuction.Web.Startup))]
namespace CHSAuction.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
