using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MessManagement.Admin
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(txt_Name.Text, txt_Password.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(txt_Name.Text, rememberme.Checked);
            }
            else
            {
                msg.Text = "Your Name or Password is not match";
            }
        }

        protected void Custom_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "admin")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

  
    }
}