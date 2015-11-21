using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class TopicDAC : TopicInfo
    {
        // Fields
        protected SqlDataReader dreader;

        // Methods
        public TopicDAC()
        {
        }

        public TopicDAC(TopicInfo info)
            : base(info)
        {
        }

        public DataTable SelectAll()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spTopicSelectAll");
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

        public bool SelectOne()
        {
            bool flag;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spTopicSelectOne");
            com.Parameters.AddWithValue("@title", base.Title);
            com.Parameters.AddWithValue("@pageName", base.PageName);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                this.dreader = com.ExecuteReader();
                if (this.dreader.Read())
                {
                    base.NumView = (this.dreader["numView"] == DBNull.Value) ? 0 : Convert.ToInt32(this.dreader["numView"]);
                    base.TopicID = (this.dreader["topicID"] == DBNull.Value) ? 0 : Convert.ToInt32(this.dreader["topicID"]);
                    base.TimeCreated = (this.dreader["timeCreated"] == DBNull.Value) ? DateTime.MinValue : Convert.ToDateTime(this.dreader["timeCreated"]);
                    base.TimeUpdated = (this.dreader["timeUpdated"] == DBNull.Value) ? DateTime.MinValue : Convert.ToDateTime(this.dreader["timeUpdated"]);
                    return true;
                }
                flag = false;
            }
            catch
            {
                throw;
            }
            finally
            {
                this.dreader.Close();
                com.Connection.Close();
            }
            return flag;
        }
    }
}
