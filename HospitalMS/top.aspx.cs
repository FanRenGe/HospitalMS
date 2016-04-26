using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LBQuit_Click(object sender, EventArgs e)
    {
        Session["usename"] = null;
        Response.Write("<script>parent.window.location.href='index.aspx'</script>");
    }
}