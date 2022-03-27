using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using MessManagement.Models;

namespace MessManagement
{
    [DataObject(true)]
    public  static class Controller
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

       [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Member> GetMembers()
        {
            List<Member> members = new List<Member>();
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select * from Member", con);
            con.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Member member = new Member();
                member.CardNumber = (int)reader["CardNumber"];
                member.Name = reader["Name"].ToString();
                member.RoomNumber = reader["RoomNumber"].ToString();
                member.Block = reader["Block"].ToString();
                member.Department = reader["Department"].ToString();
                member.PhoneNumber = reader["PhoneNumber"].ToString();
                member.Picture = reader["Picture"].ToString();
                members.Add(member);
            }
            con.Close();
            return members;
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Member SingleMember(int CardNumber)
        {
            Member member = new Member();
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand($"Select * from Member where [CardNumber] = {CardNumber}", con);
            con.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                member.CardNumber = (int)reader["CardNumber"];
                member.Name = reader["Name"].ToString();
                member.RoomNumber = reader["RoomNumber"].ToString();
                member.Block = reader["Block"].ToString();
                member.Department = reader["Department"].ToString();
                member.PhoneNumber = reader["PhoneNumber"].ToString();
                member.Picture = reader["Picture"].ToString();
            }
            con.Close();
            return member;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int DeleteMember(int CardNumber)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand($"delete from Member where [CardNumber] = {CardNumber}", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }


        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int UpdateMember(int CardNumber, string Name, string RoomNumber, string Block, string Department, string PhoneNumber, string Picture )
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand($"update Member set Name = '{Name}', [RoomNumber] = '{RoomNumber}'," +
                $" Block = '{Block}', Department = '{Department}', [PhoneNumber] = '{PhoneNumber}', Picture = '{Picture}' where [CardNumber] = {CardNumber}", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static int InsertMember(int CardNumber, string Name, string RoomNumber, string Block, string Department, string PhoneNumber, string Picture)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand($"insert into Member  values( {CardNumber},'{Name}', '{RoomNumber}', '{Block}',  '{Department}', '{PhoneNumber}',  '{Picture}' )", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }

    }
}