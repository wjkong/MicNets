using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data.SqlClient;
using System.Data;

namespace MicNets.DAL
{
    public class ItemDAC : ItemInfo
    {
        // Fields
        private SqlDataReader dReader;

        // Methods
        public ItemDAC()
        {
        }

        public ItemDAC(ItemInfo info)
            : base(info)
        {
        }

        public int DeleteOne()
        {
            int num;
            string str = "@ContactID";
            string comText = "DELETE [dbo].[Item] WHERE [itemID] = " + str;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, comText);
            com.Parameters.AddWithValue(str, base.ID);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                num = com.ExecuteNonQuery();
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
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
            SqlCommand com = SQLHelper.CreateCommand("spItemInsertOne");
            com.Parameters.AddWithValue("@description", base.Description);
            com.Parameters.AddWithValue("@name", base.Name);
            com.Parameters.AddWithValue("@price", base.Price);
            com.Parameters.AddWithValue("@cityID", base.CityID);
            com.Parameters.AddWithValue("@intersaction1", base.Intersaction1);
            com.Parameters.AddWithValue("@intersaction2", base.Intersaction2);
            com.Parameters.AddWithValue("@categoryID", base.CategoryID);
            com.Parameters.AddWithValue("@CustID", base.CustID);
            com.Parameters.AddWithValue("@DateExpired", base.ExpiredDate);
            com.Parameters.AddWithValue("@phone", base.ContactPhone);
            com.Parameters.AddWithValue("@email", base.ContactEmail);
            com.Parameters.AddWithValue("@address", base.Address);
            com.Parameters.AddWithValue("@picture", base.Picture);
            com.Parameters.AddWithValue("@thumbnail", base.Thumbnail);
            SqlParameter parameter = SQLHelper.PrepareOutputParam(com, "@ItemID");
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
                base.ID = Convert.ToInt32(parameter.Value);
                com.Connection.Close();
            }
            return num;
        }

        public DataTable SelectAll()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spItemSelectAll");
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

        public DataTable SelectAllByCityID()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spItemSelectAllByCityID");
            com.Parameters.AddWithValue("@cityID", base.CityID);
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

        public DataTable SelectAllByCustID()
        {
            DataTable table2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spItemSelectAllByCustID");
            com.Parameters.AddWithValue("@custID", base.CustID);
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
            SqlCommand command = SQLHelper.CreateCommand("spItemSelectOne");
            command.Parameters.AddWithValue("@itemID", base.ID);
            try
            {
                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                this.dReader = command.ExecuteReader(CommandBehavior.SingleRow);
                if (this.dReader.Read())
                {
                    this.Name = dReader["itemName"].ToString();
                    this.Description = dReader["description"] == System.DBNull.Value ? string.Empty : dReader["description"].ToString();
                    this.Price = dReader["price"] == System.DBNull.Value ? Decimal.Zero : Convert.ToDecimal(dReader["price"]);
                    this.Intersaction1 = dReader["intersaction1"] == System.DBNull.Value ? string.Empty : dReader["intersaction1"].ToString();
                    this.Intersaction2 = dReader["intersaction2"] == System.DBNull.Value ? string.Empty : dReader["intersaction2"].ToString();
                    this.ExpiredDate = dReader["DateExpired"] == System.DBNull.Value ? DateTime.Now.AddDays(7) : Convert.ToDateTime(dReader["DateExpired"]);
                    this.PostedDate = dReader["TimeCreated"] == System.DBNull.Value ? DateTime.Now.AddDays(7) : Convert.ToDateTime(dReader["TimeCreated"]);
                    this.City = dReader["cityName"] == System.DBNull.Value ? string.Empty : dReader["cityName"].ToString();
                    this.ContactEmail = dReader["ContactEmail"] == System.DBNull.Value ? string.Empty : dReader["ContactEmail"].ToString();
                    this.ContactPhone = dReader["ContactPhone"] == System.DBNull.Value ? string.Empty : dReader["ContactPhone"].ToString();
                    this.Address = dReader["Address"] == System.DBNull.Value ? string.Empty : dReader["Address"].ToString();
     
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
                if (this.dReader != null)
                {
                    this.dReader.Close();
                }
                command.Connection.Close();
            }
            return flag;
        }

        public byte[] SelectPicture(bool blnIsThumbnail)
        {
            byte[] buffer;
            string str = blnIsThumbnail ? "thumbnail" : "picture";
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, string.Concat(new object[] { "SELECT TOP 1 ", str, " FROM Item WHERE itemID=", base.ID }));
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                this.dReader = com.ExecuteReader(CommandBehavior.SingleRow);
                if (this.dReader.Read())
                {
                    return (byte[])this.dReader[str];
                }
                buffer = null;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (this.dReader != null)
                {
                    this.dReader.Close();
                }
                com.Connection.Close();
            }
            return buffer;
        }
    }


}
