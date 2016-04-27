using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gonggaoadd : System.Web.UI.Page
{
    string js = @"<Script language='JavaScript'>
                    alert('{0}');  
                  </Script>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                Label1.Text = "修改";
                Label2.Text = "修改";
                bind();
            }
        }
    }

    protected void btnSave_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtTitle.Text.Trim()))
        {
            Response.Write(string.Format(js, "请填写标题"));
            return;
        }
        string msg = "添加成功";
        string sql =
            string.Format("insert into gonggao values ('{0}','{1}','{2}',GETDATE())", txtTitle.Text.Trim(),
                txtSummary.Text.Trim(), txtContent.Text);
        if (Request.QueryString["id"] != null)
        {
            string id = Request.QueryString["id"];
            sql = string.Format("update gonggao set Title='{1}' , Summary='{2}', [Content]='{3}' where ID={0} ",id, txtTitle.Text.Trim(),
                txtSummary.Text.Trim(), txtContent.Text);
            msg = "修改成功";
        }

        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        var conn = new SqlConnection(strCon);
        

        SqlCommand cmd = new SqlCommand(sql, conn);

        if (conn.State == 0) conn.Open();

        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Write(string.Format("<Script language='JavaScript'>alert('{0}'); document.location='./gonggao.aspx' </Script>", msg));
    }

    protected void btnCannl_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("gonggao.aspx");
    }

    private void bind()
    {
        string id = Request.QueryString["id"];
        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        var conn = new SqlConnection(strCon);
        string sql = string.Format("select top 1 * from gonggao where id={0}", id);

        SqlCommand cmd = new SqlCommand(sql, conn);

        if (conn.State == 0) conn.Open();

        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtTitle.Text = dr["Title"].ToString();
            txtSummary.Text = dr["Summary"].ToString();
            txtContent.Text = dr["Content"].ToString();
        }
        conn.Close();
    }
}