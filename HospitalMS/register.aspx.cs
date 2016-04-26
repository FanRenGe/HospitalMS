using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    string js = @"<Script language='JavaScript'>
                    alert('{0}');  
                  </Script>";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_OnClick(object sender, EventArgs e)
    {
        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        var conn = new SqlConnection(strCon);
        if (string.IsNullOrEmpty(txtUserID.Text.Trim()))
        {
            Response.Write(string.Format(js, "请填写用户名"));
            return;
        }
        else
        {
            string sql = "select count(*) as num from useinfo where useid='" + txtUserID.Text.Trim() + "'";
            SqlCommand comm = new SqlCommand(sql, conn);
            if (conn.State == 0) conn.Open();
            object obj = comm.ExecuteScalar();
            conn.Close();

            int num = Convert.ToInt32(obj);
            if (num > 0)
            {
                Response.Write(string.Format(js, "已存在用户名 "+txtUserID.Text.Trim()));
                return;
            }
        }
        if (string.IsNullOrEmpty(txtPwd.Text.Trim()))
        {
            Response.Write(string.Format(js, "请填写密码"));
            return;
        }




        SqlCommand cmd = new SqlCommand("[zhuce]", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        if (conn.State == 0) conn.Open();
        //cmd.Parameters["@useid"].Value = txtUserID.Text.Trim();
        //cmd.Parameters["@usename"].Value = txtUserName.Text.Trim();
        //cmd.Parameters["@pwd"].Value = txtPwd.Text.Trim();
        //cmd.Parameters["@sex"].Value = ddlSex.Text;
        //cmd.Parameters["@addr"].Value = txtAddr.Text.Trim();
        //cmd.Parameters["@phone"].Value = txtPhone.Text.Trim();
        //cmd.Parameters["@rights"].Value = "挂号";


        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@useid",txtUserID.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@usename", txtUserName.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pwd", txtPwd.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sex", ddlSex.Text));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@addr", txtAddr.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@phone", txtPhone.Text.Trim()));
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@rights", "挂号"));

        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Write("<script language=javascript> alert('注册成功！');window.location.href='index.aspx'; </script>");
    }

    protected void btnCannl_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}