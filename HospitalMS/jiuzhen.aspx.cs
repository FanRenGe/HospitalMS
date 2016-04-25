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
	/// jiuzhen 的摘要说明。
	/// </summary>
	public partial class jiuzhen : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection cnn;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sda;
		protected System.Data.SqlClient.SqlCommand cmd;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		protected System.Data.SqlClient.SqlDataAdapter sd2;
		protected 医院管理系统.ds3 ds31;
		protected System.Data.SqlClient.SqlCommand cmd1;
		protected 医院管理系统.dss dss1;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand3;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand3;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand3;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand3;
		protected System.Data.SqlClient.SqlDataAdapter sda1;
		protected 医院管理系统.sda1 sda11;
		
        //Cpass cpa =new Cpass(); 
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //try
            //{
            //        string user= Session["usename"].ToString();
            //    string pwd=Session["pwds"].ToString() ; //获得变量值	
            //    if (cpa.CH(user, pwd, "就诊") == 0)//用户名或密码错或无权限	
            //    {
            //        Response.Write("<script language=javascript>alert('您不是医生，没有权限访问！')</script>");
            //        Response.Redirect("webmenu.aspx");
            //    }
			
            //} 
            //catch{  
            //    //Response.Redirect("index.aspx");
		
            //}
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sd2.SelectCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			this.sd2.SelectCommand.ExecuteNonQuery();
			this.sd2.Fill(ds31);
			this.d2.DataBind();
			cnn.Close();
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
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sd2 = new System.Data.SqlClient.SqlDataAdapter();
			this.ds31 = new 医院管理系统.ds3();
			this.cmd1 = new System.Data.SqlClient.SqlCommand();
			this.dss1 = new 医院管理系统.dss();
			this.sqlSelectCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sda1 = new System.Data.SqlClient.SqlDataAdapter();
			this.sda11 = new 医院管理系统.sda1();
			((System.ComponentModel.ISupportInitialize)(this.ds31)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dss1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.sda11)).BeginInit();
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			// 
			// cnn
			// 
			this.cnn.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=医院管理系统;Integrated Security=True";
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "[sel1]";
			this.sqlSelectCommand1.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand1.Connection = this.cnn;
			this.sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@挂号号码", System.Data.SqlDbType.NVarChar, 20));
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
			this.cmd.CommandText = "[jiuzhen1]";
			this.cmd.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd.Connection = this.cnn;
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@挂号号码", System.Data.SqlDbType.BigInt, 8));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@姓名", System.Data.SqlDbType.NVarChar, 40));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@年龄", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@性别", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@住院", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@手术", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@实验", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@诊断病况", System.Data.SqlDbType.NVarChar, 100));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@所开药方", System.Data.SqlDbType.NVarChar, 100));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@调剂", System.Data.SqlDbType.NVarChar, 100));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@复核", System.Data.SqlDbType.NVarChar, 100));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@医师", System.Data.SqlDbType.NVarChar, 20));
			// 
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "[ysheng]";
			this.sqlSelectCommand2.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand2.Connection = this.cnn;
			this.sqlSelectCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			// 
			// sd2
			// 
			this.sd2.DeleteCommand = this.sqlDeleteCommand2;
			this.sd2.InsertCommand = this.sqlInsertCommand2;
			this.sd2.SelectCommand = this.sqlSelectCommand2;
			this.sd2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// ds31
			// 
			this.ds31.DataSetName = "ds3";
			this.ds31.Locale = new System.Globalization.CultureInfo("zh-CN");
			// 
			// cmd1
			// 
			this.cmd1.CommandText = "[gh]";
			this.cmd1.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd1.Connection = this.cnn;
			this.cmd1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.Int, 4));
			// 
			// dss1
			// 
			this.dss1.DataSetName = "dss";
			this.dss1.Locale = new System.Globalization.CultureInfo("zh-CN");
			// 
			// sqlSelectCommand3
			// 
			this.sqlSelectCommand3.CommandText = "[z1]";
			this.sqlSelectCommand3.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand3.Connection = this.cnn;
			this.sqlSelectCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			// 
			// sda1
			// 
			this.sda1.DeleteCommand = this.sqlDeleteCommand3;
			this.sda1.InsertCommand = this.sqlInsertCommand3;
			this.sda1.SelectCommand = this.sqlSelectCommand3;
			this.sda1.UpdateCommand = this.sqlUpdateCommand3;
			// 
			// sda11
			// 
			this.sda11.DataSetName = "sda1";
			this.sda11.Locale = new System.Globalization.CultureInfo("zh-CN");
			((System.ComponentModel.ISupportInitialize)(this.ds31)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dss1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.sda11)).EndInit();

		}
		#endregion

		protected void Button1_Click(object sender, System.EventArgs e)
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda.SelectCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			sda.SelectCommand.Parameters["@挂号号码"].Value=tnum.Text;
			sda.SelectCommand.ExecuteNonQuery ();
			this.dss1.Clear();
			this.sda.Fill(dss1);
			this.DataGrid1.DataBind();
			cnn.Close();
			//p1.Visible =true;
		}

		protected void Button3_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("jzhenzhao.aspx");
		}

		protected void Button2_Click(object sender, System.EventArgs e)
		{
			try
			{
                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                cmd.Connection = cnn;
				if(cnn.State==0) cnn.Open();
				cmd.Parameters["@挂号号码"].Value =tnumber.Text ;
				cmd.Parameters["@姓名"].Value =tname.Text ;
				cmd.Parameters["@性别"].Value =tsex.Text ;
				cmd.Parameters["@年龄"].Value =tage.Text ;
				cmd.Parameters["@住院"].Value =r1.SelectedValue ;
				cmd.Parameters["@手术"].Value =r2.SelectedValue ;
				cmd.Parameters["@实验"].Value =d1.SelectedValue ;
				cmd.Parameters["@诊断病况"].Value =tbk.Text ;
				cmd.Parameters["@所开药方"].Value =tyf.Text ;
				cmd.Parameters["@调剂"].Value =ttj.Text ;
				cmd.Parameters["@复核"].Value =tfh.Text ;
				cmd.Parameters["@医师"].Value =d2.SelectedValue ;
				cmd.ExecuteNonQuery();
				cnn.Close();
				Response.Write("<script language=javascript>alert('添加成功！');</script>") ;
			
			}
			catch{
			Response.Write("<script language=javascript>alert('你的病历已经存在！不能在添加！');</script>") ;
			}
		}

		protected void d2_SelectedIndexChanged(object sender, System.EventArgs e)
		{

		
		}

		protected void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            cmd1.Connection = cnn;
					if(cnn.State==0) cnn.Open();
						cmd1.Parameters["@id"].Value=Convert.ToString(DataGrid1.SelectedItem.Cells[0].Text);
						SqlDataReader rd=cmd1.ExecuteReader();
						while (rd.Read())
						{
							tnumber.Text =rd.GetValue(0).ToString();
							tname.Text =rd.GetValue(1).ToString();
							tsex.Text =rd.GetValue(2).ToString();
							tage.Text =rd.GetValue(3).ToString();
						}
			
		
		}
		
		private void fills()
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda1.SelectCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			sda1.SelectCommand.ExecuteNonQuery();
			sda11.Clear(); 
			sda1.Fill(sda11); 
			this.DataGrid1.DataBind(); 
			cnn.Close();
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
//			this.DataGrid1 .CurrentPageIndex =e.NewPageIndex ;
//			fills();
		}

		protected void Button4_Click(object sender, System.EventArgs e)
		{
			this.Response.Redirect("index.aspx");
		}

		protected void Button5_Click(object sender, System.EventArgs e)
		{
		this.Response.Redirect("nanbing.aspx");
		}
        protected void Button6_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("nanzhao.aspx");
        }
}
}
