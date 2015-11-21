using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using MicNets.Model;
using System.Data;

namespace MicNets.DAL
{
    public class CustomerDAC
    {
        // Fields
        protected SqlDataReader dreader;
        protected CustomerInfo info;

        // Methods
        public CustomerDAC()
        {
        }

        public CustomerDAC(CustomerInfo info)
        {
            this.info = info;
        }

        public void DeleteAllActive()
        {
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spActiveCustomerDeleteAll");
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                com.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                com.Connection.Close();
            }
        }

        public int DeleteOne()
        {
            int num;
            string str = "@custID";
            string comText = "UPDATE [dbo].[Customer] SET enabled = 0 WHERE [custID] = " + str;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateQuery(com, comText);
            com.Parameters.AddWithValue(str, this.info.CustID);
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
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCustomerInsertOne");
            com.Parameters.Add("@userName", SqlDbType.VarChar, 8).Value = this.info.UserName;
            com.Parameters.Add("@password", SqlDbType.VarChar, 8).Value = this.info.Password;
            com.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = this.info.Email;
            com.Parameters.AddWithValue("roleID", (short)this.info.CustRole);
            SqlParameter parameter = SQLHelper.PrepareOutputParam(com, "@custID");
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
                this.info.CustID = Convert.ToInt32(parameter.Value);
                com.Connection.Close();
            }
            return num;
        }

        public bool LoginDAC()
        {
            bool flag;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCustomerSelectOnePwd");
            com.Parameters.AddWithValue("@Pwd", this.info.Password);
            com.Parameters.AddWithValue("@UserName", this.info.UserName);
            com.Parameters.AddWithValue("@SessionID", this.info.SessionID);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                this.dreader = com.ExecuteReader();
                if (this.dreader.Read())
                {
                    info.FirstName = (dreader["firstName"] == System.DBNull.Value) ? "" : dreader["firstName"].ToString();
                    info.LastName = (dreader["lastName"] == System.DBNull.Value) ? "" : dreader["lastName"].ToString();
                    info.Email = dreader["email"].ToString();
                    info.LangPrefer = dreader["langID"].ToString();
                    info.CustRole = (NRole)(Convert.ToInt16(dreader["roleID"]));
                    info.LangUsing = info.LangPrefer;

                 
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
                if (this.dreader != null)
                {
                    this.dreader.Close();
                }
                com.Connection.Close();
            }
            return flag;
        }

        public DataSet SelectAll()
        {
            DataSet set2;
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCustomerSelectAll");
            try
            {
                com.Connection.Open();
                adapter.SelectCommand = com;
                adapter.Fill(dataSet, com.CommandText);
                set2 = dataSet;
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
            return set2;
        }

        public bool SelectOne()
        {
            bool flag;
            SqlCommand com = new SqlCommand();
            if (this.info.CurrentTask == NTaskCustomer.LoadByUsername)
            {
                SQLHelper.CreateCommand(com, "spCustomerSelectOneByUsername");
                com.Parameters.Add("@userName", SqlDbType.VarChar, 8).Value = this.info.UserName;
            }
            else if (this.info.CurrentTask == NTaskCustomer.LoadBySessionID)
            {
                SQLHelper.CreateCommand(com, "spCustomerSelectOneBySessionID");
                com.Parameters.AddWithValue("@sessionID", this.info.SessionID);
            }
            else if (this.info.CurrentTask.Equals(NTaskCustomer.LoadByEmail))
            {
                SQLHelper.CreateCommand(com, "spCustomerSelectOneByEmail");
                com.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = this.info.Email;
            }
            else
            {
                SQLHelper.CreateCommand(com, "spCustomerSelectOneByCustID");
                com.Parameters.Add("@custID", SqlDbType.Int).Value = this.info.CustID;
            }
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                this.dreader = com.ExecuteReader();
                if (this.dreader.Read())
                {
                    info.FirstName = (dreader["firstName"] == System.DBNull.Value) ? "" : dreader["firstName"].ToString();
                    info.LastName = (dreader["lastName"] == System.DBNull.Value) ? "" : dreader["lastName"].ToString();
                    info.Email = dreader["email"].ToString();
                    info.LangPrefer = dreader["langID"].ToString();
                    info.CustRole = (NRole)(Convert.ToInt16(dreader["roleID"]));
                    info.LangUsing = info.LangPrefer;
                    info.UserName = dreader["userName"].ToString();
                    info.CustID = Convert.ToInt32(dreader["custID"]);

                    
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

        public int UpdateOne()
        {
            int num;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCustomerUpdateOne");
            com.Parameters.Add("@userName", SqlDbType.VarChar, 8).Value = this.info.UserName;
            com.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = this.info.Email;
            //comUpdate.Parameters.Add("@firstName", SqlDbType.VarChar, 15).Value = this.info.FirstName;
            //comUpdate.Parameters.Add("@lastName", SqlDbType.VarChar, 20).Value = this.info.LastName;
            com.Parameters.Add("@custID", SqlDbType.Int).Value = this.info.CustID;

            if (this.info.CustRole != NRole.DEFAULT)
            {
                com.Parameters.AddWithValue("@roleID", (short)this.info.CustRole);
            }
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

        public int UpdatePwd()
        {
            int num;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCustomerUpdatePwd");
            com.Parameters.Add("@custID", SqlDbType.Int).Value = this.info.CustID;
            com.Parameters.AddWithValue("@password", this.info.Password);
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
    }


}
