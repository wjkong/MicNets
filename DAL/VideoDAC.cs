using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class VideoDAC : VideoInfo
    {
        // Methods
        public VideoDAC(VideoInfo info)
            : base(info)
        {
        }

        public int InsertOne()
        {
            int num;
            SqlCommand com = SQLHelper.CreateCommand("spVideoInsertOne");
            com.Parameters.AddWithValue("@description", base.Description);
            com.Parameters.AddWithValue("@locationTaken", base.Location);
            com.Parameters.AddWithValue("@timeTaken", base.DateTaken);
            com.Parameters.AddWithValue("@youTubeID", base.YouTubeCode);
            com.Parameters.AddWithValue("@thumbnail", base.Thumbnail);
            SqlParameter parameter = SQLHelper.PrepareOutputParam(com, "@videoID");
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
                base.VideoID = Convert.ToInt32(parameter.Value);
                com.Connection.Close();
            }
            return num;
        }

        public DataTable SelectAll()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spVideoSelectAll");
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                adapter.SelectCommand = com;
                DataTable dataTable = new DataTable(com.CommandText);
                adapter.Fill(dataTable);
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
