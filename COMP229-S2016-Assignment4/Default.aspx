<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="COMP229_S2016_Assignment4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COMP229 - S2016 - Kevin Ma | 300867968</title>
    <!--CSS-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/app.css" rel="stylesheet" />
</head>
<body>
    <header class="jumbotron text-center">
        <h1>COMP229 Assignment 4 - Using ADO.NET</h1>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">
                <div class="col-sm-offset-2 col-sm-8">
                    <h3>Search for Player(s) from the Toronto Blue Jays Database</h3>
                    <hr />
                    Search by:
                    <asp:DropDownList ID="searchCategory" runat="server">
                        <asp:ListItem Text="Player Number" />
                        <asp:ListItem Text="Name" />
                        <asp:ListItem Text="Position" />
                    </asp:DropDownList>
                    <asp:TextBox ID="searchTextBox" runat="server" />
                    <asp:Button ID="submitButton" runat="server"
                        Text="Get Data" OnClick="submitButton_Click" /><br />
                    <br />
                    <asp:Repeater ID="myRepeater" runat="server">
                        <HeaderTemplate>
                            <table width="800" border="1">
                                <tr>
                                    <th>Player Number</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Height (cm)</th>
                                    <th>Weight (pounds)</th>
                                    <th>Date of Birth</th>
                                    <th>Batting / Throwing</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center"><%# Eval("PlayerID") %></td>
                                <td style="text-align: center"><%# Eval("name") %></td>
                                <td style="text-align: center"><%# Eval("position") %></td>
                                <td style="text-align: center"><%# Eval("height") %></td>
                                <td style="text-align: center"><%# Eval("weight") %></td>
                                <td style="text-align: center"><%# Eval("dob") %></td>
                                <td style="text-align: center"><%# Eval("skill") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div id="NoRecords" runat="server" visible="false">
                    </div>
                </div>
            </form>
        </div>
        <footer class="row">
            <div class="col-xs-12 text-center">
                <h6>&copy;&nbsp;2016 Kevin Ma | Student #: 300867968. All Rights Reserved.</h6>
            </div>
        </footer>
    </div>
    <!--JavaScript-->
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
</body>
</html>
