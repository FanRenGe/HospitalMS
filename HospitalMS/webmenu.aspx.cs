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
	/// webmenu ��ժҪ˵����
	/// </summary>
	public partial class webmenu : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection cnn;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlDataAdapter sda;
	    Cpass cpa =new Cpass();
	 	protected void Page_Load(object sender, System.EventArgs e)
		{
            string strRight = Session["useright"].ToString();
            if (strRight == "")
                Response.Redirect("index.aspx");
            else {
                if (strRight == "�Һ�")
                {
                    HyperLink1.Enabled = true;
                    HyperLink1.ToolTip = "";
                }
                else if(strRight=="����")
                {
                    HyperLink4.Enabled = true;
                    HyperLink4.ToolTip = "";
                }
                else if (strRight == "��λ����")
                {
                    HyperLink3.Enabled = true;
                    HyperLink3.ToolTip = "";
                }
                else if (strRight == "ҽ������")
                {
                    HyperLink2.Enabled = true;
                    HyperLink2.ToolTip = "";
                }


            
            
            }




        //try
        //{
        //    string user= Session["usename"].ToString();
        //    string pwd=Session["pwds"].ToString() ; //��ñ���ֵ	
        //    string rights = Session["useright"].ToString();
        //    if(cpa.CH(user, pwd, rights)==0)//�û����������					
        //    {
        //        Response.Write("<script language=javascript>alert('����ǰ����δ��¼״̬��')</script>");
        //        Response.Redirect("index.aspx");
        //    }

        //}
        //    catch{  Response.Redirect("index.aspx");} 	
			Label1.Text=Session["usename"].ToString();
			
			
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
			this.cnn = new System.Data.SqlClient.SqlConnection();
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sda = new System.Data.SqlClient.SqlDataAdapter();
			// 
			// cnn
			// 
            this.cnn.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=ҽԺ����ϵͳ;Integrated Security=True";
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = "[update1]";
			this.sqlUpdateCommand1.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlUpdateCommand1.Connection = this.cnn;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@useid", System.Data.SqlDbType.NVarChar, 20));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pwd", System.Data.SqlDbType.NVarChar, 20));
			// 
			// sda
			// 
			this.sda.DeleteCommand = this.sqlDeleteCommand1;
			this.sda.InsertCommand = this.sqlInsertCommand1;
			this.sda.SelectCommand = this.sqlSelectCommand1;
			this.sda.UpdateCommand = this.sqlUpdateCommand1;

		}
		#endregion

		protected void Button1_Click(object sender, System.EventArgs e)
		{
			//Label1.Text=Session["usename"].ToString();
            string strCon = "server=.;database=ҽԺ����ϵͳ;uid=sa;pwd=sa123;";
            cnn = new System.Data.SqlClient.SqlConnection();
            cnn.ConnectionString = strCon;
            sda.UpdateCommand.Connection = cnn;
			if(cnn.State==0) cnn.Open();
			sda.UpdateCommand.Parameters["@useid"].Value=this.Label1.Text;
			sda.UpdateCommand.Parameters["@pwd"].Value =tpwd.Text;
			sda.UpdateCommand.ExecuteNonQuery();
			Response.Write("<script language=javascript>alert('�޸ĳɹ���');</script>") ;
		}
	}
}
