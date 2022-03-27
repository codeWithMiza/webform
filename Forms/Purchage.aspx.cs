using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MessManagement.Forms
{
    public partial class Purchage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}