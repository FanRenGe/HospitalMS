using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class useredit : System.Web.UI.Page
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
                string uesid = Session["usename"].ToString();
                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
               SqlConnection cnn = new System.Data.SqlClient.SqlConnection();
              
                cnn.ConnectionString = strCon;
              
                SqlDataAdapter adapter = new SqlDataAdapter("select * from useinfo where useid='" + uesid + "'  ", cnn);
                DataSet ds = new DataSet();
                adapter.Fill(ds, "userinfo");
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow dr = ds.Tables[0].Rows[0];
                        txtUserID.Text = dr["useid"].ToString();
                        txtUserName.Text = dr["usename"].ToString();
                        ddlSex.SelectedValue = dr["sex"].ToString();
                        txtAddr.Text = dr["addr"].ToString();
                        txtPhone.Text = dr["phone"].ToString();

                    }
                }
               
            }
            
        
        }
    }

    protected void btnSave_OnClick(object sender, EventArgs e)
    {
        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        var conn = new SqlConnection(strCon);
        string sql =
            string.Format("update useinfo set usename='{1}' , sex='{2}' ,addr='{3}', phone='{4}' where useid='{0}'",
                txtUserID.Text, txtUserName.Text.Trim(), ddlSex.SelectedValue, txtAddr.Text.Trim(), txtPhone.Text.Trim());

        SqlCommand cmd = new SqlCommand(sql, conn);
        
        if (conn.State == 0) conn.Open();
        
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Write(string.Format(js, "修改成功"));
    }
    protected void btnCannl_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("main.html");
    }
}