using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Data.SqlClient;

namespace MicNets.DAL
{
    public class LocationDAC : LocationInfo
    {
        // Methods
        public LocationDAC(LocationInfo info)
            : base(info)
        {
        }

        public int InsertOne()
        {
            int num;
            SqlCommand com = SQLHelper.CreateCommand("spLocationInsertOne");
            SQLHelper.PrepareOutputParam(com, "@LocationID");
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

        public DataSet SelectAll()
        {
            DataSet set2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spLocationSelectAllByCountryID");
            com.Parameters.AddWithValue("@countryID", base.CountryID);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                adapter.SelectCommand = com;
                DataSet dataSet = new DataSet(com.CommandText);
                adapter.Fill(dataSet);
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

        public DataSet SelectAllCityByProvinceID()
        {
            DataSet set2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand();
            SQLHelper.CreateCommand(com, "spCitySelectAllByProvinceID");
            com.Parameters.AddWithValue("@provinceID", base.ProvinceID);
            try
            {
                if (com.Connection.State == ConnectionState.Closed)
                {
                    com.Connection.Open();
                }
                adapter.SelectCommand = com;
                DataSet dataSet = new DataSet(com.CommandText);
                adapter.Fill(dataSet);
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
    }
}
