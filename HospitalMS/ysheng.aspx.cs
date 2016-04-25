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
using System.IO;


namespace 医院管理系统
{
	/// <summary>
	/// ysheng 的摘要说明。
	/// </summary>
	public partial class ysheng : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection cnn;
		protected System.Data.SqlClient.SqlCommand cmd;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sda;
		protected 医院管理系统.dsa dsa1;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		protected System.Data.SqlClient.SqlCommand cmd1;
		protected System.Data.SqlClient.SqlCommand cmd2;
		protected System.Data.SqlClient.SqlDataAdapter sda1;
	   Cpass cpa =new Cpass();
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				string user= Session["usename"].ToString();
				string pwd=Session["pwds"].ToString() ; //获得变量值	
				if(cpa.CH(user, pwd, "医生管理")==0)//用户名或密码错或无权限					
                {   Response.Write("<script language=javascript>alert('您不是管理员，没有权限管理医生资料！')</script>");
                Response.Redirect("webmenu.aspx");}
            
            } 
			catch{  Response.Redirect("index.aspx");} 	
			fills();// 在此处放置用户代码以初始化页面
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
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sda = new System.Data.SqlClient.SqlDataAdapter();
			this.dsa1 = new 医院管理系统.dsa();
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sda1 = new System.Data.SqlClient.SqlDataAdapter();
			this.cmd1 = new System.Data.SqlClient.SqlCommand();
			this.cmd2 = new System.Data.SqlClient.SqlCommand();
			((System.ComponentModel.ISupportInitialize)(this.dsa1)).BeginInit();
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			// 
			// cnn
			// 
			this.cnn.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=医院管理系统;Integrated Security=True";
			// 
			// cmd
			// 
			this.cmd.CommandText = "[myinxiu]";
			this.cmd.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd.Connection = this.cnn;
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@put", System.Data.SqlDbType.NVarChar, 12));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.Int, 4));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@mydata", System.Data.SqlDbType.VarBinary, 2147483647));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@姓名", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@性别", System.Data.SqlDbType.NVarChar, 10));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@出生年月", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@籍贯", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@种族", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@政治面貌", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@学历", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@职务", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@电话", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@邮箱", System.Data.SqlDbType.NVarChar, 20));
			this.cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@家庭地址", System.Data.SqlDbType.NVarChar, 50));
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "[hh1]";
			this.sqlSelectCommand1.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand1.Connection = this.cnn;
			this.sqlSelectCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = "[del]";
			this.sqlDeleteCommand1.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlDeleteCommand1.Connection = this.cnn;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.Int, 4));
			// 
			// sda
			// 
			this.sda.DeleteCommand = this.sqlDeleteCommand1;
			this.sda.InsertCommand = this.sqlInsertCommand1;
			this.sda.SelectCommand = this.sqlSelectCommand1;
			this.sda.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// dsa1
			// 
			this.dsa1.DataSetName = "dsa";
			this.dsa1.Locale = new System.Globalization.CultureInfo("zh-CN");
			// 
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "[select1]";
			this.sqlSelectCommand2.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlSelectCommand2.Connection = this.cnn;
			this.sqlSelectCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlSelectCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@sel", System.Data.SqlDbType.NVarChar, 20));
			this.sqlSelectCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50));
			// 
			// sda1
			// 
			this.sda1.DeleteCommand = this.sqlDeleteCommand2;
			this.sda1.InsertCommand = this.sqlInsertCommand2;
			this.sda1.SelectCommand = this.sqlSelectCommand2;
			this.sda1.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// cmd1
			// 
			this.cmd1.CommandText = "[xiangxi]";
			this.cmd1.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd1.Connection = this.cnn;
			this.cmd1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.Int, 4));
			// 
			// cmd2
			// 
			this.cmd2.CommandText = "[myimin1]";
			this.cmd2.CommandType = System.Data.CommandType.StoredProcedure;
			this.cmd2.Connection = this.cnn;
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@mydata", System.Data.SqlDbType.VarBinary, 2147483647));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@姓名", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@性别", System.Data.SqlDbType.NVarChar, 10));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@出生年月", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@籍贯", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@种族", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@政治面貌", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@学历", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@职务", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@电话", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@邮箱", System.Data.SqlDbType.NVarChar, 20));
			this.cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@家庭地址", System.Data.SqlDbType.NVarChar, 50));
			((System.ComponentModel.ISupportInitialize)(this.dsa1)).EndInit();

		}
		#endregion

		

		private void fills()
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda.SelectCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			sda.SelectCommand.ExecuteNonQuery();
			dsa1.Clear(); 
			sda.Fill(dsa1); 
			cnn.Close();
			DataGrid1.DataBind(); 
			
		}

		protected void Button1_Click(object sender, System.EventArgs e)
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda1.SelectCommand.Connection = cnn;
			
			if(cnn.State==0) cnn.Open();
			sda1.SelectCommand.Parameters["@sel"].Value=TextBox1.Text;
			sda1.SelectCommand.Parameters["@name"].Value=TextBox2.Text;
			sda1.SelectCommand.ExecuteNonQuery ();
			this.dsa1.Clear();
			this.sda1.Fill(dsa1);
			this.DataGrid1.DataBind();
			cnn.Close();
	
		}

		protected void Button2_Click(object sender, System.EventArgs e)
		{
			Panel2.Visible =true;
            Submit.Visible =false;
			
		}

		protected void Button5_Click(object sender, System.EventArgs e)
		{
			Panel1.Visible =true;
//			this.DataGrid1.SelectedIndex=-1;
			
		}

		protected void Button6_Click(object sender, System.EventArgs e)
		{
			if(DataGrid1.SelectedIndex==-1)
			{
				Response.Write("<script language=javascript>alert('你还没选择！');</script>") ;
			}
			else
			{
				Panel2.Visible =true;

				Submit.Text="修改";
				Button7.Visible =false;
                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                cmd1.Connection = cnn;
				if(cnn.State==0) cnn.Open();
				cmd1.Parameters["@id"].Value=Convert.ToInt32(DataGrid1.SelectedItem.Cells[1].Text);
				SqlDataReader rd=cmd1.ExecuteReader();
				while (rd.Read())
				{
					tname.Text=rd.GetValue(1).ToString();
					tjg.Text=rd.GetValue(4).ToString();
					tzz.Text =rd.GetValue(5).ToString();
					
					tdh.Text=rd.GetValue(9).ToString();
					tem.Text =rd.GetValue(10).ToString();
					tdz.Text =rd.GetValue(11).ToString();

				}
			}
			
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;
			fills();
		}

		protected void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			Panel2.Visible =false;


		}

		protected void Submit_Click(object sender, System.EventArgs e)
		{
			Panel2.Visible =false;
			if(this.File1.Value=="")
			{
				Response.Write("<script language=javascript>alert('你还没选择图片路径！')</script>") ;
				return;
			}
			else
			{
			
				string file=File1.PostedFile.FileName ;
				string type=file.Substring(file.LastIndexOf(".")+1);
				byte[] fileCont = new byte[File1.PostedFile.ContentLength];
				File1.PostedFile.InputStream.Read(fileCont,0,(int)File1.PostedFile.ContentLength); //将文件流中的内容转成byte数组

                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                cmd.Connection = cnn;
                if(cnn.State==0) cnn.Open();
				cmd.Parameters["@put"].Value=Submit.Text;
				if(Submit.Text=="上传")
				{
				   cmd.Parameters["@id"].Value=11;
	
				}
				else
				{
					cmd.Parameters["@id"].Value=DataGrid1.SelectedItem.Cells[1].Text;
				}
				cmd.Parameters["@mydata"].Value = fileCont ; 			
				cmd.Parameters ["@姓名"].Value =tname.Text ;
				cmd.Parameters ["@性别"].Value =r1.SelectedValue ;
				cmd.Parameters ["@出生年月"].Value =d1.SelectedValue + "-" + d2.SelectedValue;
				cmd.Parameters ["@籍贯"].Value =tjg.Text  ;
				cmd.Parameters ["@种族"].Value =tzz.Text  ;
				cmd.Parameters ["@政治面貌"].Value =d3.SelectedValue;
				cmd.Parameters ["@学历"].Value =d4.SelectedValue  ;
				cmd.Parameters ["@职务"].Value =d6.SelectedValue  ;
				cmd.Parameters ["@电话"].Value =tdh.Text  ;
				cmd.Parameters ["@邮箱"].Value =tem.Text  ;
				cmd.Parameters ["@家庭地址"].Value =tdz.Text  ;
				cmd.ExecuteNonQuery();
				cnn.Close();
//				fills();
//				Response.Write("<script language=javascript>alert('恭喜你！！！你已成功的填完！')</script>") ;                 
				string kk="";
				if(Submit.Text=="上传")
				{
					kk="添加成功！";
				}
				else
				{
					kk="修改成功！";
				}
				Response.Write("<script language=javascript>alert('"+kk+"');</script>") ;
				fills();
				this.DataGrid1.SelectedIndex=-1;
				tname.Text="";
				tjg.Text="";
				tzz.Text ="";
				
				tdh.Text="";
				tem.Text ="";
				tdz.Text ="";
			}
		}

		protected void Button3_Click(object sender, System.EventArgs e)
		{
			if(DataGrid1.SelectedIndex==-1)
			{
				Response.Write("<script language=javascript>alert('你还没选择！');</script>") ;
			}
			else
			{
                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                sda.DeleteCommand.Connection = cnn;
				if(cnn.State==0) cnn.Open();
				sda.DeleteCommand.Parameters["@id"].Value=DataGrid1.SelectedItem.Cells[1].Text;
				sda.DeleteCommand.ExecuteNonQuery ();
				cnn.Close();
				fills();
				this.DataGrid1.SelectedIndex=-1;

			}
		}

		protected void Button7_Click(object sender, System.EventArgs e)
		{
			Panel2.Visible =false;
			if(this.File1.Value=="")
			{
				Response.Write("<script language=javascript>alert('你还没选择图片路径！')</script>") ;
				return;
			}
			else
			{
			
				string file=File1.PostedFile.FileName ;
				string type=file.Substring(file.LastIndexOf(".")+1);
				byte[] fileCont = new byte[File1.PostedFile.ContentLength];
				File1.PostedFile.InputStream.Read(fileCont,0,(int)File1.PostedFile.ContentLength); //将文件流中的内容转成byte数组

                string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                cmd2.Connection = cnn;
                if(cnn.State==0) cnn.Open();
				cmd2.Parameters["@mydata"].Value = fileCont ; 			
				cmd2.Parameters ["@姓名"].Value =tname.Text ;
				cmd2.Parameters ["@性别"].Value =r1.SelectedValue ;
				cmd2.Parameters ["@出生年月"].Value =d1.SelectedValue + "-" + d2.SelectedValue;
				cmd2.Parameters ["@籍贯"].Value =tjg.Text  ;
				cmd2.Parameters ["@种族"].Value =tzz.Text  ;
				cmd2.Parameters ["@政治面貌"].Value =d3.SelectedValue;
				cmd2.Parameters ["@学历"].Value =d4.SelectedValue  ;
				cmd2.Parameters ["@职务"].Value =d6.SelectedValue  ;
				cmd2.Parameters ["@电话"].Value =tdh.Text  ;
				cmd2.Parameters ["@邮箱"].Value =tem.Text  ;
				cmd2.Parameters ["@家庭地址"].Value =tdz.Text  ;
				cmd2.ExecuteNonQuery();
				cnn.Close();
				fills();
				
			}
		}

		protected void Button8_Click(object sender, System.EventArgs e)
		{
			this.Response.Redirect("index.aspx");
		}



        protected void Button4_Click(object sender, EventArgs e)
        {

        }
}
}
