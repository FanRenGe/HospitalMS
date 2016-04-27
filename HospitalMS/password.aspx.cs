using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class password : System.Web.UI.Page
{
    string js = @"<Script language='JavaScript'>
                    alert('{0}');  
                  </Script>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["usename"] != null)
            {
                txtUserID.Text = Session["usename"].ToString();
            }
            else
            {
                Response.Write("<script>parent.window.location.href='index.aspx'</script>");
            }
        }
    }

    protected void btnSave_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtPwd.Text.Trim()))
        {
            Response.Write(string.Format(js, "请填写密码"));
            return;
        }
        if (txtPwd.Text.Trim() != txtPwd2.Text.Trim())
        {
            Response.Write(string.Format(js, "两次输入的密码不一致"));
            return;
        }

        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        var conn = new System.Data.SqlClient.SqlConnection(strCon);

        SqlCommand cmd = new SqlCommand("[update1]", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        if (conn.State == 0) conn.Open();

        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@useid", txtUserID.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pwd", txtPwd.Text.Trim()));

        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write(string.Format(js, "修改成功"));
    }

    protected void btnCannl_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("main.html");
    }
}