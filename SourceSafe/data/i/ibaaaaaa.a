using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class PhotoDAC : PhotoInfo
    {
        // Methods
        public PhotoDAC(PhotoInfo info)
            : base(info)
        {
        }

        public int InsertOne()
        {
            int num;
            SqlCommand com = SQLHelper.CreateCommand("spPhotoInsertOne");
            com.Parameters.AddWithValue("@timeTaken", base.DateTaken);
            SqlParameter parameter = SQLHelper.PrepareOutputParam(com, "@photoID");
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                num = com.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                base.PhotoID = Convert.ToInt32(parameter.Value);
                com.Connection.Close();
            }
            return num;
        }

        public DataTable SelectAll()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spPhotoSelectAll");
            com.Parameters.AddWithValue("@indexPage", base.PageIndex);
            com.Parameters.AddWithValue("@pageSize", base.PageSize);
            SqlParameter parameter = SQLHelper.PrepareOutputParam(com, "@maxPageIndex");
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                adapter.SelectCommand = com;
                DataTable dataTable = new DataTable(com.CommandText);
                adapter.Fill(dataTable);
                base.MaxPageIndex = Convert.ToInt32(parameter.Value);
                table2 = dataTable;
            }
            catch
            {
                throw;
            }
            finally
            {
                adapter.Dispose();
                com.Connection.Close();
            }
            return table2;
        }
    }


}
