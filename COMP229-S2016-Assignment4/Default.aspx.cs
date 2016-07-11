using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace COMP229_S2016_Assignment4
{
    public partial class Default : System.Web.UI.Page
    {
        protected void submitButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string searchCriteria = searchCategory.SelectedValue;

            conn = new SqlConnection("Server=localhost\\SqlExpress;" +
                "Database=TorontoBlueJays;Integrated Security=True");

            switch (searchCriteria)
            {
                case "Player Number":
                    comm = new SqlCommand(
                            "SELECT playerid, name, position, height, weight, dob, skill  FROM Players " +
                            "WHERE PlayerID=@PlayerID", conn);
                    break;
                case "Name":
                    comm = new SqlCommand(
                            "SELECT playerid, name, position, height, weight, dob, skill  FROM Players " +
                            "WHERE name=@name", conn);
                    break;
                default: // position
                    comm = new SqlCommand(
                            "SELECT playerid, name, position, height, weight, dob, skill  FROM Players " +
                            "WHERE position=@position", conn);
                    break;
            }

            int playerID = 0;
            string searchText;
            if (searchCriteria == "Player Number" && !int.TryParse(searchTextBox.Text, out playerID))
            {
                NoRecords.InnerText = "Please enter a numeric ID!";
                NoRecords.Visible = true;
                myRepeater.Visible = false;
            }
            else
            {
                searchText = searchTextBox.Text;

                switch (searchCriteria)
                {
                    case "Player Number":
                        comm.Parameters.Add("@PlayerID", System.Data.SqlDbType.Int);
                        comm.Parameters["@PlayerID"].Value = playerID;
                        break;
                    case "Name":
                        comm.Parameters.Add("@name", System.Data.SqlDbType.NVarChar);
                        comm.Parameters["@name"].Value = searchText;
                        break;
                    default: // position
                        comm.Parameters.Add("@position", System.Data.SqlDbType.NVarChar);
                        comm.Parameters["@position"].Value = searchText;
                        break;
                }

                try
                {
                    conn.Open();
                    reader = comm.ExecuteReader();
                    myRepeater.DataSource = reader;
                    myRepeater.DataBind();
                    reader.Close();
                    if (myRepeater.Items.Count < 1)
                    {
                        NoRecords.InnerText = "No Records Available.";
                        NoRecords.Visible = true;
                        myRepeater.Visible = false;
                    }
                    else
                    {
                        NoRecords.Visible = false;
                        myRepeater.Visible = true;
                    }
                }
                catch
                {
                    NoRecords.InnerText = "Error retrieving player data.";
                    myRepeater.Visible = false;
                    NoRecords.Visible = true;
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}