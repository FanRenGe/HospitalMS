using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;

namespace ҽԺ����ϵͳ
{
	/// <summary>
	/// Cpass ��ժҪ˵����
	/// </summary>
	public class Cpass : System.ComponentModel.Component
	{
        private System.Data.SqlClient.SqlConnection cnn;
		private System.Data.SqlClient.SqlCommand cmm;

        private System.Data.SqlClient.SqlDataReader Dr;
		/// <summary>
		/// ����������������
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Cpass(System.ComponentModel.IContainer container)
		{
			///
			/// Windows.Forms ��׫д�����֧���������
			///
			container.Add(this);
			InitializeComponent();

			//
			// TODO: �� InitializeComponent ���ú�����κι��캯������
			//
		}
		public int CH(string usename,string pwd,string rights)
		{
            string strCon = "server=.;database=ҽԺ����ϵͳ;uid=sa;pwd=sa123;";
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
			/// Windows.Forms ��׫д�����֧���������
			///
			InitializeComponent();

			//
			// TODO: �� InitializeComponent ���ú�����κι��캯������
			//
		}

		/// <summary> 
		/// ������������ʹ�õ���Դ��
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


		#region �����������ɵĴ���
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{
            this.cnn = new System.Data.SqlClient.SqlConnection();
            this.cmm = new System.Data.SqlClient.SqlCommand();
            // 
            // cnn
            // 
            this.cnn.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=ҽԺ����ϵͳ;Integrated Security=True";
            this.cnn.FireInfoMessageEventOnUserErrors = false;
            // 
            // cmm
            // 
            this.cmm.Connection = this.cnn;

		}
		#endregion
	}
}
