using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using MicNets.Model;
using System.Data;

namespace MicNets.DAL
{
    public class LinkDAC
    {
        // Fields
        protected SqlDataReader dreader;
        protected LinkInfo info;

        // Methods
        public LinkDAC(LinkInfo info)
        {
            this.info = info;
        }

        public bool CheckUserAccess()
        {
            bool flag;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "dbo.spRoleLinkCanUserAccess");
            com.Parameters.AddWithValue("@url", this.info.URL);
            com.Parameters.AddWithValue("@sessionID", this.info.SessionID);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                flag = Convert.ToBoolean(com.ExecuteScalar());
            }
            catch
            {
                throw;
            }
            finally
            {
                com.Connection.Close();
            }
            return flag;
        }

        public int DeleteOne()
        {
            int num;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spLinkDeleteOne");
            com.Parameters.Add("@linkID", SqlDbType.Int).Value = this.info.LinkID;
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
            SQLHelper.CreateCommand(com, "spLinkInsertOne");
            com.Parameters.Add("@text", SqlDbType.VarChar, 35).Value = this.info.Text;
            com.Parameters.Add("@url", SqlDbType.VarChar, 100).Value = this.info.URL;
            com.Parameters.Add("@parentLinkID", SqlDbType.Int).Value = this.info.ParentLinkID;
            com.Parameters.AddWithValue("@isExternal", this.info.IsExternal);
            com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
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

        public DataSet SelectAll()
        {
            DataSet set2;
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            switch (this.info.CurrentTask)
            {
                case NTaskLink.LoadAllTop:
                    SQLHelper.CreateCommand(com, "spLinkSelectAllTop");
                    com.Parameters.AddWithValue("@isExternal", this.info.IsExternal);
                    com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
                    break;

                case NTaskLink.LoadAllByParent:
                    SQLHelper.CreateCommand(com, "spLinkSelectAllByParent");
                    com.Parameters.AddWithValue("@isExternal", this.info.IsExternal);
                    com.Parameters.Add("@parentLinkID", SqlDbType.Int).Value = this.info.ParentLinkID;
                    com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
                    break;

                case NTaskLink.LoadAllByRole:
                    SQLHelper.CreateCommand(com, "spRoleLinkSelectAllByRole");
                    com.Parameters.Add("@roleID", SqlDbType.SmallInt).Value = this.info.RoleID;
                    com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
                    Helper oHelper = new Helper();
                    if (!oHelper.IsNullOrEmpty(this.info.Culture))
                        com.Parameters.AddWithValue("@culture", this.info.Culture);
                    break;

                case NTaskLink.LoadAllBySessionID:
                    SQLHelper.CreateCommand(com, "spLinkSelectAllBySessionID");
                    com.Parameters.AddWithValue("@sessionID", this.info.SessionID);
                    com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
                    break;

                case NTaskLink.LoadAllExternal:
                    SQLHelper.CreateCommand(com, "spLinkSelectAllExternal");
                    break;
            }
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
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
                com.Connection.Close();
            }
            return set2;
        }

        public int UpdateAll()
        {
            int num;
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spRoleLinkUpdateAll");
            com.Parameters.Add("@roleID", SqlDbType.SmallInt).Value = this.info.RoleID;
            com.Parameters.Add("@linkIDs", SqlDbType.VarChar, 500).Value = this.info.URL;
            com.Parameters.AddWithValue("@linkCatagoryID", (int)this.info.LinkCategory);
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

        public int UpdateOne()
        {
            int num;
            SqlCommand com = new SqlCommand();
            if (this.info.CurrentTask == NTaskLink.UpdateOneSequence)
            {
                SQLHelper.CreateCommand(com, "spLinkUpdateOneSequence");
                com.Parameters.Add("@sequence", SqlDbType.Int).Value = this.info.Sequence;
            }
            else
            {
                SQLHelper.CreateCommand(com, "spLinkUpdateOne");
                com.Parameters.Add("@text", SqlDbType.VarChar, 0x23).Value = this.info.Text;
                com.Parameters.Add("@url", SqlDbType.VarChar, 100).Value = this.info.URL;
            }
            com.Parameters.Add("@linkID", SqlDbType.Int).Value = this.info.LinkID;
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
    }


}
