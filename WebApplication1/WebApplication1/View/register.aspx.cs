﻿using System;
using MySql.Data.MySqlClient;
using System.Text;
using System.Security.Cryptography;

namespace WebApplication1.View
{
    public partial class register : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        protected void checkAvail_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String command = "select * from project_notes.users where username='" + usernameField + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);

            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            int count = 0;
            while (myReader.Read())
            {
                count = count + 1;
            }
            if (count == 0 && string.IsNullOrEmpty(usernameField) == false)
            {
                Response.Write("this username is available");
            }
            else if(string.IsNullOrEmpty(usernameField) == true)
            {
                Response.Write("please enter your username");
            }
            else
            {
                Response.Write("this username has been taken");
            }
            conn.Close();
        }

        protected void register_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String passwordField = MD5Hash(password.Text);
            String emailField = email.Text;
            String firstNameField = firstName.Text;
            String lastNameField = lastName.Text;
            String dobField = dateOfBirth.Text;
            Boolean passEqual = checkPassword(password.Text, confirmPassword.Text);

            if (passEqual)
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("insert into users (username, lastName, firstName, email, password, dateOfBirth) values ('" + usernameField + "','" + lastNameField + "','" + firstNameField + "','" + emailField + "','" + passwordField + "','" + dobField + "')", conn);
                cmd.ExecuteNonQuery();
                cmd.Clone();
            }
            else
            {
                Response.Write("Password does not match");
            }
        }
        
        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }

        public Boolean checkPassword(string pass1, string pass2)
        {
            if(pass1.Equals(pass2))
            {
                return true;
            }
            return false;
        }
    }

}