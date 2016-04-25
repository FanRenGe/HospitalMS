using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace 医院管理系统
{
	/// <summary>
	/// zhuce 的摘要说明。
	/// </summary>
	public partial class zhuce : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection cnn;
		protected System.Data.SqlClient.SqlCommand cmd;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.cnn = new System.Data.SqlClient.SqlConnection();
			this.cmd = new System.Data.SqlClient.SqlCommand();
			// 
			// cnn
			// 
            this.cnn.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=医院管理系统;Integrated Security=True";
			// 
			// cmd
			// 
			this.cmd.CommandText = "[zhuce]";
			this.cmd.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd.Connection = this.cnn;
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@useid", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@usename", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pwd", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sex", System.Data.SqlDbType.NVarChar, 2));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@addr", System.Data.SqlDbType.NVarChar, 50));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@rights", System.Data.SqlDbType.NVarChar, 40));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@phone", System.Data.SqlDbType.NVarChar, 20));

		}
		#endregion

		protected void Button1_Click(object sender, System.EventArgs e)
		{

            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            cmd.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			cmd.Parameters["@useid"].Value=tname.Text;
			cmd.Parameters["@usename"].Value=tname1.Text;
			cmd.Parameters["@pwd"].Value =tpwd.Text;
			cmd.Parameters["@rights"].Value =d1.SelectedValue;
			cmd.Parameters["@sex"].Value =d2.SelectedValue;
			cmd.Parameters["@addr"].Value =tadd.Text;
			cmd.Parameters["@phone"].Value =tphone.Text;
				try
			{
				cmd.ExecuteNonQuery ();
					Response.Write("<script language=javascript>alert('添加成功！');</script>");
			}
			catch
			{
				Response.Write("<script language=javascript>alert('该用户名已经存在，请选择其它的！');</script>");
			}
               cnn.Close();
           
			}

		protected void Tpwd_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void Button3_Click(object sender, System.EventArgs e)
		{
			this.Response .Redirect("mimagai.aspx");
		}
        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("zhuce.aspx");
        }
        protected void pass_TextChanged(object sender, EventArgs e)
        {

        }
}
}
