using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using MicNets.Model.DataSets;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class ContactDAC : ContactInfo
    {
        // Methods
        public ContactDAC()
        {
        }

        public ContactDAC(ContactInfo info)
            : base(info)
        {
        }

        public int DeleteOne()
        {
            int num;
            string str = "@ContactID";
            string comText = "DELETE [dbo].[Contact] WHERE [ContactID] = " + str;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, comText);
            com.Parameters.AddWithValue(str, base.ContactID);
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
            SqlCommand command = SQLHelper.CreateCommand("spContactInsertOne");
            command.Parameters.AddWithValue("@lastName", base.LastName);
            command.Parameters.AddWithValue("@firstName", base.FirstName);
            command.Parameters.AddWithValue("@phone", base.Phone);
            command.Parameters.AddWithValue("@cellPhone", base.CellPhone);
            command.Parameters.AddWithValue("@email", base.Email);
            command.Parameters.AddWithValue("@isChina", base.IsFromChina);
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

        public DataTable SelectAll()
        {
            DataTable table2;
            SqlCommand command = SQLHelper.CreateCommand("spContactSelectAll");
            command.Parameters.AddWithValue("@isPopup", base.IsPopup);
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

        public void SelectAll(DSContact dsContact)
        {
            SqlCommand command = SQLHelper.CreateCommand("spContactSelectAll");

            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            
            if (command.Connection.State == ConnectionState.Closed)
                command.Connection.Open();
            
            try
            {
                adapter.Fill(dsContact.DTContact);
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
            
        }

        public bool SelectOne()
        {
            return true;
        }

        public int UpdateOne()
        {
            int num;
            SqlCommand command = SQLHelper.CreateCommand("spContactUpdateOne");
            command.Parameters.AddWithValue("@ContactID", base.ContactID);
            command.Parameters.AddWithValue("@lastName", base.LastName);
            command.Parameters.AddWithValue("@firstName", base.FirstName);
            command.Parameters.AddWithValue("@phone", base.Phone);
            command.Parameters.AddWithValue("@cellPhone", base.CellPhone);
            command.Parameters.AddWithValue("@email", base.Email);
            command.Parameters.AddWithValue("@isChina", base.IsFromChina);
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
