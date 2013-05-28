using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusinezMen
{
    public partial class Adicionar_Candidato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            data.Text = calendario.SelectedDate.ToShortDateString();
            calendario.Visible = false;
        }

        protected void Data_Change(object sender, EventArgs e)
        {
            calendario.Visible = true;
        }
    }
}