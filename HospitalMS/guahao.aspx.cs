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
using System.Data.SqlClient;

namespace 医院管理系统
{
	/// <summary>
	/// wubi 的摘要说明。
	/// </summary>
	public partial class wubi : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection cnn;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sda;
		protected System.Data.SqlClient.SqlCommand cmd;
		protected System.Web.UI.WebControls.RadioButtonList r1;
		protected 医院管理系统.ds ds1;
		Cpass cpa =new Cpass(); 
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
					string user= Session["usename"].ToString();
				string pwd=Session["pwds"].ToString() ; //获得变量值	
				if(cpa.CH(user, pwd, "挂号")==0)//用户名或密码错或无权限					
                {  Response.Write("<script language=javascript>alert('您不是挂号窗口，没有权限访问！')</script>");
                Response.Redirect("webmenu.aspx");
            }
            } 
			catch{  Response.Redirect("index.aspx");} 	
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
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sda = new System.Data.SqlClient.SqlDataAdapter();
			this.cmd = new System.Data.SqlClient.SqlCommand();
			this.ds1 = new 医院管理系统.ds();
			((System.ComponentModel.ISupportInitialize)(this.ds1)).BeginInit();
			// 
			// cnn
			// 
			this.cnn.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=医院管理系统;Integrated Security=True";
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "[sel]";
			this.sqlSelectCommand1.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand1.Connection = this.cnn;
			this.sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sel", System.Data.SqlDbType.NVarChar, 20));
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.Connection = this.cnn;
			// 
			// sda
			// 
			this.sda.DeleteCommand = this.sqlDeleteCommand1;
			this.sda.InsertCommand = this.sqlInsertCommand1;
			this.sda.SelectCommand = this.sqlSelectCommand1;
			this.sda.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// cmd
			// 
			this.cmd.CommandText = "[guahao1]";
			this.cmd.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd.Connection = this.cnn;
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 40));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@age", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sex", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@xing", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@money", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@bingli", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@add", System.Data.SqlDbType.NVarChar, 50));
			// 
			// ds1
			// 
			this.ds1.DataSetName = "ds";
			this.ds1.Locale = new System.Globalization.CultureInfo("zh-CN");
			((System.ComponentModel.ISupportInitialize)(this.ds1)).EndInit();

		}
		#endregion

		protected void Button3_Click(object sender, System.EventArgs e)
		{
			pl.Visible=true;
	        tname1.Text =tname.Text ;
			DataGrid1.Visible =true;

            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda.SelectCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			sda.SelectCommand.Parameters["@sel"].Value=tname1.Text;
			sda.SelectCommand.ExecuteNonQuery ();
			this.ds1.Clear();
			this.sda.Fill(ds1);
			this.DataGrid1.DataBind();
			cnn.Close();
		}
		
		protected void Button1_Click(object sender, System.EventArgs e)
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            cmd.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			cmd.Parameters["@name"].Value =tname.Text ; 
			cmd.Parameters["@age"].Value =tage.Text ;
			cmd.Parameters["@sex"].Value =r11.SelectedValue;
			cmd.Parameters["@xing"].Value=this.DropDownList1.SelectedValue;
			cmd.Parameters["@money"].Value =r2.SelectedValue ;
		    cmd.Parameters["@bingli"].Value =r3.SelectedValue ;
			cmd.Parameters["@add"].Value =tadd.Text ;
		    cmd.ExecuteNonQuery();
			 cnn.Close();
			Response.Write("<script language=javascript>alert('挂号成功！请获取你的挂号号码！！！');</script>");
			
			
		   
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			this.Response.Redirect("guahaocz.aspx");
		}
	}
}
