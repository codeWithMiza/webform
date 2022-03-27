using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MessManagement.Forms
{
    public partial class FormControls : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {


            var param = ObjectDataSource2.InsertParameters;
            param["CardNumber"].DefaultValue = txtCard.Text;
            param["Name"].DefaultValue = txtName.Text;
            param["RoomNumber"].DefaultValue = txtRoom.Text;
            param["Block"].DefaultValue = ddlBlock.Text;
            param["Department"].DefaultValue = txtDept.Text;
            param["PhoneNumber"].DefaultValue = txtPhone.Text;

                string fname = System.IO.Path.GetFileName(picLoad.PostedFile.FileName);
                string folderPic = Server.MapPath("~/Images/") + fname;
                picLoad.SaveAs(folderPic);
                param["Picture"].DefaultValue = "~/Images/" + fname;
            
            ObjectDataSource2.Insert();
            gvMember.DataBind();
        }



        protected void gvMember_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void gvMember_PreRender(object sender, EventArgs e)
        {
            if(gvMember.HeaderRow != null)
            {
                gvMember.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void dvMember_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gvMember.DataBind();
        }

        protected void dvMember_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gvMember.DataBind();
        }

        protected void btn_Click(object sender, EventArgs e)
        {


            FileUpload fl = (FileUpload)dvMember.FindControl("myload");
            Image img = (Image)dvMember.FindControl("myImg");

                string fname = System.IO.Path.GetFileName(fl.PostedFile.FileName);
                string roolName = Server.MapPath("~/Images/") + fname;
                fl.SaveAs(roolName);
                img.ImageUrl = "~/Images/" +fname;
            
        }

        protected void btnOutside_Click(object sender, EventArgs e)
        {
            btn_Click(null, null);
        }

        protected void UpdatePanel1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void dvMember_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {

        }
    }
}