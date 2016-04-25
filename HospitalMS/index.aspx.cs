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
	/// index 的摘要说明。
	/// </summary>
	public partial class index : System.Web.UI.Page
	{
		Cpass cpa = new Cpass();
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //Tname.Text = "";
            //Tpwd.Text = "";
			//Session["usename"] =Tname.Text;// 在此处放置用户代码以初始化页面
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

		}
		#endregion

		//登录按钮
        protected void Button1_Click(object sender, System.EventArgs e)
		{
            int count = cpa.CH(Tname.Text, Tpwd.Text, DDright.Text.Trim());

			if(count==0)
			{
                
				Response.Write("<script language=javascript>alert('你的用户名或密码或权限有误！')</script>") ;
                Tpwd.Text = "";
			
			}
			else if(count==1)
			{
                Session["usename"] = Tname.Text; //传递用户名和密码值
                Session["pwds"] = Tpwd.Text;
                Session["useright"] = DDright.Text;
                Response.Redirect("webmenu.aspx");
			}
		}


        //取消按钮
		protected void Button2_Click(object sender, System.EventArgs e)
		{
		  Tname.Text="";
			Tpwd.Text ="";
		}
	}
}
