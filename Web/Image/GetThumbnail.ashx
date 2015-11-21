<%@ WebHandler Language="C#" Class="GetThumbnail" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MicNets.Model;
public class GetThumbnail : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        Helper oHelper = new Helper();
        
        if (!oHelper.IsWholeNumber(context.Request.QueryString["videoID"].ToString()))
             return;
            
        int videoID = Convert.ToInt32(context.Request.QueryString["videoID"]);
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MicnetsCon"].ToString());
        string SQL = @"SELECT thumbnail FROM Video WHERE videoID = @videoID AND thumbnail IS NOT NULL";
        SqlCommand cmd = new SqlCommand(SQL, con);
        cmd.Parameters.AddWithValue("@videoID", videoID);

        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataReader oDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess);

            if (oDataReader.Read())
            {
                int bufferSize = 100;
                byte[] bytes = new byte[bufferSize];
                long bytesRead;
                long readFrom = 0;

                do
                {
                    bytesRead = oDataReader.GetBytes(0, readFrom, bytes, 0, bufferSize);
                    context.Response.BinaryWrite(bytes);
                    readFrom += bufferSize;
                }
                while (bytesRead == bufferSize);
            }

            oDataReader.Close();
        }
        catch
        {
            return;
        }
        finally
        {
            con.Close();
        }
        
        
    }
 
    public bool IsReusable {
        get {
            return true;
        }
    }

}