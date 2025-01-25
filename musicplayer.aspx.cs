#backendcode
using System;
using System.Web.UI;

namespace MusicPlayerApp
{
    public partial class musicplayer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Show the login panel initially and hide the music player panel
                LoginPanel.Visible = true;
                MusicPlayerPanel.Visible = false;
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // Hardcoded credentials for demonstration purposes
            string validUsername = "admin";
            string validPassword = "admin";

            // Retrieve the username and password entered by the user
            string enteredUsername = TextBox1.Text.Trim();
            string enteredPassword = TextBox2.Text;

            // Validate the entered credentials
            if (enteredUsername == validUsername && enteredPassword == validPassword)
            {
                // If login is successful, show the music player and hide the login form
                LoginPanel.Visible = false;
                MusicPlayerPanel.Visible = true;
            }
            else
            {
                // If login fails, display an alert message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Invalid username or password.');", true);
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            // Clear the input fields for username and password
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }
    }
}
