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

namespace ҽԺ����ϵͳ
{
	/// <summary>
	/// index ��ժҪ˵����
	/// </summary>
	public partial class index : System.Web.UI.Page
	{
		Cpass cpa = new Cpass();
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //Tname.Text = "";
            //Tpwd.Text = "";
			//Session["usename"] =Tname.Text;// �ڴ˴������û������Գ�ʼ��ҳ��
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		//��¼��ť
        protected void Button1_Click(object sender, System.EventArgs e)
		{
            int count = cpa.CH(Tname.Text, Tpwd.Text, DDright.Text.Trim());

			if(count==0)
			{
                
				Response.Write("<script language=javascript>alert('����û����������Ȩ������')</script>") ;
                Tpwd.Text = "";
			
			}
			else if(count==1)
			{
                Session["usename"] = Tname.Text; //�����û���������ֵ
                Session["pwds"] = Tpwd.Text;
                Session["useright"] = DDright.Text;
                Response.Redirect("webmenu.aspx");
			}
		}


        //ȡ����ť
		protected void Button2_Click(object sender, System.EventArgs e)
		{
		  Tname.Text="";
			Tpwd.Text ="";
		}
	}
}
