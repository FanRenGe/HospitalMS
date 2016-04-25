using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;

namespace 医院管理系统
{
	/// <summary>
	/// Cpass 的摘要说明。
	/// </summary>
	public class Cpass : System.ComponentModel.Component
	{
        private System.Data.SqlClient.SqlConnection cnn;
		private System.Data.SqlClient.SqlCommand cmm;

        private System.Data.SqlClient.SqlDataReader Dr;
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Cpass(System.ComponentModel.IContainer container)
		{
			///
			/// Windows.Forms 类撰写设计器支持所必需的
			///
			container.Add(this);
			InitializeComponent();

			//
			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
			//
		}
		public int CH(string usename,string pwd,string rights)
		{
            string strCon = "server=.;database=医院管理系统;uid=sa;pwd=sa123;";
                cnn = new System.Data.SqlClient.SqlConnection();
                cnn.ConnectionString = strCon;
                //if(cnn.State==0)      
            cnn.Open();
            cmm.Connection = cnn;
                //cmm.Parameters["@useid"].Value = usename;
                //cmm.Parameters["@pwd"].Value = pwd ;
                //cmm.Parameters["@rights"].Value = rights ;
                cmm.CommandText = "select * from useinfo,useright where useinfo.useid=useright.useid and useinfo.useid='" + usename + "' and pwd='" + pwd + "' and rights='" + rights + "'";
                             
                Dr = cmm.ExecuteReader();
                //string pasd=cmm.Parameters["@pass"].Value.ToString();

                if (Dr.Read())
                {
                    cnn.Close();
                    return (1);
                }
                else
                {
                    cnn.Close();
                    return (0);
                }
		}

		public Cpass()
		{
			///
			/// Windows.Forms 类撰写设计器支持所必需的
			///
			InitializeComponent();

			//
			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
			//
		}

		/// <summary> 
		/// 清理所有正在使用的资源。
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}


		#region 组件设计器生成的代码
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{
            this.cnn = new System.Data.SqlClient.SqlConnection();
            this.cmm = new System.Data.SqlClient.SqlCommand();
            // 
            // cnn
            // 
            this.cnn.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=医院管理系统;Integrated Security=True";
            this.cnn.FireInfoMessageEventOnUserErrors = false;
            // 
            // cmm
            // 
            this.cmm.Connection = this.cnn;

		}
		#endregion
	}
}
