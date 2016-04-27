using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gonggaochakan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }

    private void bind()
    {
        string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
        SqlConnection cnn = new System.Data.SqlClient.SqlConnection();

        cnn.ConnectionString = strCon;

        SqlDataAdapter adapter = new SqlDataAdapter("select ID,Title,Summary,[Content],CONVERT(varchar(19),createTime,120) as CreateTime from gonggao order by ID desc  ", cnn);
        DataSet ds = new DataSet();
        adapter.Fill(ds, "g");
        if (ds.Tables.Count > 0)
        {
            repGongGao.DataSource = ds.Tables[0];
            repGongGao.DataBind();
        }
    }
}