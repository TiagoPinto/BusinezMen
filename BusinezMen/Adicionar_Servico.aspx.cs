using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusinezMen
{
    public partial class Adicionar_Servico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "2")
            {
                Table4.Visible = true;
                Table9.Visible = false;
                Table12.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value == "1")
            {
                Table4.Visible = false;
                Table9.Visible = false;
                Table12.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value == "3")
            {
                Table4.Visible = true;
                Table9.Visible = true;
                Table12.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value == "4")
            {
                Table4.Visible = true;
                Table9.Visible = true;
                Table12.Visible = true;
            }
        }
    }
}