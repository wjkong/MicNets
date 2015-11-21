using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class PropertyDAC : PropertiesInfo
    {
        // Methods
        public PropertyDAC()
        {
        }

        public PropertyDAC(PropertiesInfo info)
            : base(info)
        {
        }

        public int DeleteOne()
        {
            int num;
            string str = "@PropertyID";
            string comText = "DELETE [dbo].[Property] WHERE [PropertyID] = " + str;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, comText);
            com.Parameters.AddWithValue(str, base.PropertyID);
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
            SqlCommand command = SQLHelper.CreateCommand("spPropertyInsertOne");
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
            SqlCommand command = SQLHelper.CreateCommand("spPropertySelectAll");
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

        public bool SelectOne()
        {
            return true;
        }

        public int UpdateOne()
        {
            int num;
            SqlCommand command = SQLHelper.CreateCommand("spPropertyUpdateOne");

            command.Parameters.AddWithValue("@SKU", this.SKU);
            command.Parameters.AddWithValue("@Description", this.Description);
            command.Parameters.AddWithValue("@PricePurchased", this.PricePurchased);
            command.Parameters.AddWithValue("@PlacePurchased", this.PlacePurchased);
            command.Parameters.AddWithValue("@DatePurchased", this.DatePurchased);
            command.Parameters.AddWithValue("@HasReceipt", this.HasReceipt);

            try
            {
                if (command.Connection.State == ConnectionState.Closed)
                     command.Connection.Open();
                
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
