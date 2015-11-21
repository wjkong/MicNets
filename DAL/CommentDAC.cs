using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class CommentDAC : CommentInfo
    {
        // Methods
        public CommentDAC()
        {
        }

        public CommentDAC(CommentInfo info)
            : base(info)
        {
        }

        public int DeleteOne()
        {
            int num;
            string comText = "DELETE [dbo].[Comment] WHERE [commentID] = @commentId";
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, comText);
            com.Parameters.AddWithValue("@commentID", base.CommentID);
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
                com.Connection.Close();
            }
            return num;
        }

        public int InsertOne()
        {
            int num;
            SqlCommand command = SQLHelper.CreateCommand("spCommentInsertOne");
            command.Parameters.AddWithValue("@Content", base.Content);
            command.Parameters.AddWithValue("@TopicID", base.TopicID);
            command.Parameters.AddWithValue("@custName", base.CustName);
            try
            {
                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                num = command.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                command.Connection.Close();
            }
            return num;
        }

        public DataTable SelectAllByTopic()
        {
            DataTable table2;
            SqlCommand command = SQLHelper.CreateCommand("spCommentSelectAllByTopic");
            command.Parameters.AddWithValue("@TopicID", base.TopicID);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            if (command.Connection.State == ConnectionState.Closed)
            {
                command.Connection.Open();
            }
            try
            {
                DataTable dataTable = new DataTable(command.CommandText);
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
                command.Connection.Close();
            }
            return table2;
        }

        public int UpdateOne()
        {
            int num;
            SqlCommand command = SQLHelper.CreateCommand("spCommentUpdateOne");
            command.Parameters.AddWithValue("@Content", base.Content);
            command.Parameters.AddWithValue("@CustID", base.CustID);
            command.Parameters.AddWithValue("@TopicID", base.TopicID);
            command.Parameters.AddWithValue("@CommentID", base.CommentID);
            try
            {
                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                num = command.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                command.Connection.Close();
            }
            return num;
        }
    }


}
