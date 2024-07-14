using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using System.Windows;
using System.Diagnostics;
using Stripe;
using AjaxControlToolkit;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for Clothes
/// </summary>
public class Clothes {
    private string _id;
    private string _name;
    private int _quantity;
    private decimal _price;
    private string _overview;
    private char _gender;
    private int _category_id;
    private string _link;
    private DateTime _dateAdded;

    // GET / SET
    public string id { get { return _id; } }
    public string name { get { return _name; } set { _name = value; } }
    public int quantity { get { return _quantity; } set { _quantity = value; } }
    public decimal price { get { return _price; } set { _price = value; } }
    public string overview { get { return _overview; } set { _overview = value; } }
    public char gender { get { return _gender; } set { _gender = value; } }
    public int category_id { get { return _category_id; } set { _category_id = value; } }
    public string link { get { return _link; } }
    public DateTime DateAdded { get => _dateAdded; }
    public Clothes(string id, string name, int quantity, decimal price, string overview, char gender, int category_id, string link, DateTime dateAdded) {
        this._id = id;
        this._name = name;
        this._quantity = quantity;
        this._price = price;
        this._overview = overview;
        this._gender = gender;
        this._category_id = category_id;
        this._link = link;
        this._dateAdded = dateAdded;
    }
    public static Clothes getClothesID(string clothesID) {
        Clothes clothingObj;

        int quantity, category_id;
        string id, name, overview, link;
        decimal price;
        char gender;
        DateTime dateAdded;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from Clothes WHERE ID = @cid", conn);
        cmd.Parameters.AddWithValue("@cid", clothesID);

        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read()) {
            id = dr["Id"].ToString();
            name = dr["name"].ToString();
            quantity = int.Parse(dr["quantity"].ToString());
            price = decimal.Parse(dr["price"].ToString());
            overview = dr["overview"].ToString();
            gender = char.Parse(dr["gender"].ToString());
            category_id = int.Parse(dr["category_id"].ToString());
            link = dr["link"].ToString();
            dateAdded = DateTime.Parse(dr["dateAdded"].ToString());

            clothingObj = new Clothes(id, name, quantity, price, overview, gender, category_id, link, dateAdded);
        } else {
            clothingObj = null;
        }

        conn.Close();
        dr.Close();
        dr.Dispose();

        return clothingObj;
    }
}

/// <summary>
/// Shopping Cart Object
/// </summary>
public class Cart {
    public string item_name;
    public int item_quantity;
    public double item_price;
    public string item_color;
    public string item_size;
    public string clothes_id;

    public Cart(string item_name, int item_quantity, double item_price, string item_color, string item_size, string clothes_id) {
        this.item_name = item_name;
        this.item_quantity = item_quantity;
        this.item_price = item_price;
        this.item_color = item_color;
        this.item_size = item_size;
        this.clothes_id = clothes_id;
    }
}

/// <summary>
/// Account class for accounts table
/// </summary>
public class Account {
    private string _id;
    private string _firstname;
    private string _lastname;
    private string _email;
    private bool _emailConfirmed;
    private bool _isAdmin;
    private string _password;
    private string _mobilenumber;
    private bool _mfaEnabled;
    private string _secret_key;
    private string _adress1;
    private string _adress2;
    private string _zipcode;

    // GET / SET
    public string id { get { return _id; } }
    public string firstname { get { return _firstname; } set { _firstname = value; } }
    public string lastname { get { return _lastname; } set { _lastname = value; } }
    public string email { get { return _email; } set { _email = value; } }
    public bool emailConfirmed { get { return _emailConfirmed; } set { _emailConfirmed = value; } }
    public bool isAdmin { get { return _isAdmin; } }
    public string password { get { return _password; } }
    public string mobilenumber { get { return _mobilenumber; } set { _mobilenumber = value; } }
    public bool mfaEnabled { get { return _mfaEnabled; } set { _mfaEnabled = value; } }
    public string secret_key { get { return _secret_key; } set { _secret_key = value; } }
    public string adress1 { get { return _adress1; } set { _adress1 = value; } }
    public string adress2 { get { return _adress2; } set { _adress2 = value; } }
    public string zipcode { get { return _zipcode; } set { _zipcode = value; } }

    // Methods
    public Account(string id, string firstname, string lastname, string email, bool emailConfirmed, bool isAdmin, string password, string mobilenumber, bool mfaEnabled, string secret_key, string adress1, string adress2, string zipcode) {
        this._id = id;
        this._firstname = firstname;
        this._lastname = lastname;
        this._email = email;
        this._emailConfirmed = emailConfirmed;
        this._isAdmin = isAdmin;
        this._password = password;
        this._mobilenumber = mobilenumber;
        this._mfaEnabled = mfaEnabled;
        this._secret_key = secret_key;
        this._adress1 = adress1;
        this._adress2 = adress2;
        this._zipcode = zipcode;
    }
    public static Account GetAccount(string emailParam) {
        Account account = null;

        //string id, firstname, lastname, email, password, mobilenumber, secret_key, adress1, adress2, zipcode;
        //bool isAdmin, mfaEnabled;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from Accounts WHERE email = @email", conn);
        cmd.Parameters.AddWithValue("@email", emailParam);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read()) {
            account = new Account(
                dr["Id"].ToString(),
                dr["first_name"].ToString(),
                dr["last_name"].ToString(),
                dr["email"].ToString(),
                bool.Parse(dr["emailConfirmed"].ToString()),
                bool.Parse(dr["isAdmin"].ToString()),
                dr["password"].ToString(),
                dr["mobile_number"].ToString(),
                bool.Parse(dr["multi_factor_enabled"].ToString()),
                dr["secret_key"].ToString(),
                dr["address1"].ToString(),
                dr["address2"].ToString(),
                dr["zipcode"].ToString()
                );
        } else {
            account = null;
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return account;
    }
    public class SecretKeys {
        public string stripe_api_key { get; set; }
    }
}
 
public class SecretKeys {
    public string stripe_api_key { get; set; }
    public string google_public { get; set; }
    public string google_secret { get; set; }
    public string sendgrid_api_key { get; set; }
    public string sendgrid_email { get; set; }
    public string ipify { get; set; }
}
public class ForgetPasswordTemplateData {
    [JsonProperty("resetlink")]
    public string resetlink { get; set; }

    //[JsonProperty("name")]
    //public string Name { get; set; }
}
public class VerificationEmailTemplateData {
    [JsonProperty("verifylink")]
    public string verifylink { get; set; }

    [JsonProperty("name")]
    public string name { get; set; }
}
public class Function {
    public static string GenerateRandomPassword(int size) {
        // Create a strong random password for user
        Random rand = new Random();
        string possibleChars = "abcdefghijklmnopqrstuvwxyz0123456789QWERTYUIOPASDFGHJKLZXCVBNM!@#$^&*()";
        char[] randomPassword = new char[size];

        for (int i = 0; i < size; i++) {
            randomPassword[i] = possibleChars[rand.Next(possibleChars.Length)];
        }
        return string.Join("", randomPassword);
    }
    public static string DecryptEmailToken(string textToDecrypt) {
        try {
            //string  = "6+PXxVWlBqcUnIdqsMyUHA==";
            string ToReturn = "";
            string publickey = "12345678";
            string secretkey = "87654321";
            byte[] privatekeyByte = { };
            privatekeyByte = Encoding.UTF8.GetBytes(secretkey);
            byte[] publickeybyte = { };
            publickeybyte = Encoding.UTF8.GetBytes(publickey);
            MemoryStream ms = null;
            CryptoStream cs = null;
            byte[] inputbyteArray = new byte[textToDecrypt.Replace(" ", "+").Length];
            inputbyteArray = Convert.FromBase64String(textToDecrypt.Replace(" ", "+"));
            using (DESCryptoServiceProvider des = new DESCryptoServiceProvider()) {
                ms = new MemoryStream();
                cs = new CryptoStream(ms, des.CreateDecryptor(publickeybyte, privatekeyByte), CryptoStreamMode.Write);
                cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                cs.FlushFinalBlock();
                Encoding encoding = Encoding.UTF8;
                ToReturn = encoding.GetString(ms.ToArray());
            }
            return ToReturn;
        } catch (Exception ae) {
            throw new Exception(ae.Message, ae.InnerException);
        }
    }
    public static bool HasEmailTokenExpired(string token, int tokenLifeSpanDays = 3) {
        var data = Convert.FromBase64String(token);
        var tokenCreationDate = DateTime.FromBinary(BitConverter.ToInt64(data, 0));
        return tokenCreationDate < DateTime.UtcNow.AddDays(-tokenLifeSpanDays);
    }
    public static string EncryptEmailToken(string textToEncrypt) {
        try {
            //string  = "WaterWorld";
            string ToReturn = "";
            string publickey = "12345678";
            string secretkey = "87654321";
            byte[] secretkeyByte = { };
            secretkeyByte = Encoding.UTF8.GetBytes(secretkey);
            byte[] publickeybyte = { };
            publickeybyte = Encoding.UTF8.GetBytes(publickey);
            MemoryStream ms = null;
            CryptoStream cs = null;
            byte[] inputbyteArray = Encoding.UTF8.GetBytes(textToEncrypt);
            using (DESCryptoServiceProvider des = new DESCryptoServiceProvider()) {
                ms = new MemoryStream();
                cs = new CryptoStream(ms, des.CreateEncryptor(publickeybyte, secretkeyByte), CryptoStreamMode.Write);
                cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                cs.FlushFinalBlock();
                ToReturn = Convert.ToBase64String(ms.ToArray());
            }
            return ToReturn;
        } catch (Exception ex) {
            throw new Exception(ex.Message, ex.InnerException);
        }
    }
    public static string CreateEmailToken(byte[] arg) {
        var time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary());
        var key = arg ?? Guid.NewGuid().ToByteArray();
        var token = Convert.ToBase64String(time.Concat(key).ToArray());

        return token;
    }

    // Admin DB
    public static GridView GetAllClothes(GridView gridView)
    {
        DataTable dt = new DataTable();
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand("Product_CRUD", connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@ACTION", "SELECT");
                command.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter sql = new SqlDataAdapter())
                {
                    sql.SelectCommand = command;

                    sql.Fill(dt);
                }
                if (dt.Rows.Count > 0)
                {
                    gridView.DataSource = dt;
                    gridView.DataBind();
                    gridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    gridView.DataSource = dt;
                    gridView.DataBind();
                    gridView.Rows[0].Cells.Clear();
                    gridView.Rows[0].Cells.Add(new TableCell());
                    gridView.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    gridView.Rows[0].Cells[0].Text = "No Clothes in Database";
                    gridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    gridView.Rows[0].Cells[0].VerticalAlign = VerticalAlign.Middle;
                }
            }
        }
        return gridView;
    }
    public static GridView AdminUpdateClothe(GridView gridView, int rowIndex) {
        try
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
            {
                using (SqlCommand sql = new SqlCommand("Product_CRUD", connection))
                {
                    connection.Open();
                    sql.Parameters.AddWithValue("@ACTION", "UPDATE");
                    sql.CommandType = CommandType.StoredProcedure;
                    sql.Parameters.AddWithValue("@id", gridView.DataKeys[rowIndex].Value.ToString());
                    sql.Parameters.AddWithValue("@name", (gridView.Rows[rowIndex].FindControl("TextBox_name") as TextBox).Text.Trim());
                    sql.Parameters.AddWithValue("@quantity", Convert.ToInt32((gridView.Rows[rowIndex].FindControl("TextBox_quantity") as TextBox).Text.Trim()));
                    sql.Parameters.AddWithValue("@price", Convert.ToDouble((gridView.Rows[rowIndex].FindControl("TextBox_price") as TextBox).Text.Trim()));
                    sql.Parameters.AddWithValue("@overview", (gridView.Rows[rowIndex].FindControl("TextBox_Overview") as TextBox).Text.Trim());
                    sql.Parameters.AddWithValue("@gender", (gridView.Rows[rowIndex].FindControl("TextBox_gender") as TextBox).Text.Trim());
                    sql.Parameters.AddWithValue("@category_id", Convert.ToInt32((gridView.Rows[rowIndex].FindControl("TextBox_categoryID") as TextBox).Text.Trim()));
                    sql.Parameters.AddWithValue("@link", (gridView.Rows[rowIndex].FindControl("TextBox_link") as TextBox).Text.Trim());
                    //sql.Parameters.AddWithValue("@", );
                    sql.ExecuteNonQuery();
                    gridView.EditIndex = -1;
                    //gridView = GetAllClothes(gridView);
                    return gridView;
                }
            }
        }
        catch (SqlException)
        {
            return null;
        }
        catch (FormatException)
        {
            return null;
        }
    }
    public static GridView AdminDeleteClothe(GridView gridView, int rowIndex, HttpServerUtility server)
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
            {
                using (SqlCommand sql = new SqlCommand("Product_CRUD", connection))
                {
                    connection.Open();
                    string id = gridView.DataKeys[rowIndex].Value.ToString();
                    sql.Parameters.AddWithValue("@ACTION", "DELETE");
                    sql.CommandType = CommandType.StoredProcedure;
                    sql.Parameters.AddWithValue("@id", id);
                    sql.ExecuteNonQuery();

                    // Remove Directory
                    DirectoryInfo di = new DirectoryInfo(server.MapPath(@"/assets/img/_clothing/carousel/" + id + "/"));
                    foreach (FileInfo file in di.GetFiles())
                    {
                        file.Delete();
                    }
                    di.Delete();

                    gridView = GetAllClothes(gridView);
                    return gridView;
                }
            }
        }
        catch (SqlException) { return null; }
    }
    public static GridView AdminInsertClothing(GridView gridView, GridViewCommandEventArgs e, HttpServerUtility server) {
        try
        {
            if (e.CommandName == "Add") {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
                {
                    using (SqlCommand sql = new SqlCommand("Product_CRUD", connection))
                    {
                        connection.Open();
                        sql.Parameters.AddWithValue("@ACTION", "INSERT");
                        sql.CommandType = CommandType.StoredProcedure;
                        string id = Guid.NewGuid().ToString();
                        sql.Parameters.AddWithValue("@id", id);
                        sql.Parameters.AddWithValue("@name", (gridView.HeaderRow.FindControl("Add_Name") as TextBox).Text.Trim());
                        sql.Parameters.AddWithValue("@quantity", Convert.ToInt32((gridView.HeaderRow.FindControl("Add_Quantity") as TextBox).Text.Trim()));
                        sql.Parameters.AddWithValue("@price", Convert.ToDouble((gridView.HeaderRow.FindControl("Add_Price") as TextBox).Text.Trim()));
                        sql.Parameters.AddWithValue("@overview", (gridView.HeaderRow.FindControl("Add_Overview") as TextBox).Text.Trim());
                        sql.Parameters.AddWithValue("@gender", (gridView.HeaderRow.FindControl("Add_Gender") as TextBox).Text.Trim().ToUpper());
                        sql.Parameters.AddWithValue("@category_id", Convert.ToInt32((gridView.HeaderRow.FindControl("Add_CategoryID") as TextBox).Text.Trim()));
                        sql.Parameters.AddWithValue("@link", (gridView.HeaderRow.FindControl("Add_Link") as TextBox).Text.Trim());
                        sql.Parameters.AddWithValue("@today", DateTime.Now);
                        sql.ExecuteNonQuery();

                        // Create directory for images
                        string path = server.MapPath(@"/assets/img/_clothing/carousel/" + id);
                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }

                        // Save Images
                        StringBuilder files = new StringBuilder();
                        FileUpload images = (gridView.HeaderRow.FindControl("FileUpload_image") as FileUpload);
                        try
                        {
                            if (images.HasFiles)
                            {

                                foreach (var image in images.PostedFiles)
                                {

                                    // Check if "1.jpg" exists, if not rename the image to it - Saving images
                                    if (!System.IO.File.Exists(Path.Combine(path, "1.jpg"))) image.SaveAs(Path.Combine(path, "1.jpg"));
                                    else image.SaveAs(Path.Combine(path, image.FileName));
                                }
                            }
                        }
                        catch (Exception err)
                        {
                            Debug.WriteLine(err);
                            return null;
                        }
                        //return gridView;
                        return GetAllClothes(gridView);
                    }
                }
            }
        }
        catch (SqlException err)
        {
            Debug.WriteLine(err);
            return null;
        }
        catch (FormatException err)
        {
            Debug.WriteLine(err);
            return null;
        }
        return null;
    }
    public static DataTable GetCountries()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ToString());
        SqlCommand cmd = new SqlCommand("select * from countries", con);
        DataTable tb = new DataTable();
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        tb.Load(dr, LoadOption.OverwriteChanges);
        con.Close();
        return tb;
    }
    public static DataTable GetCategories()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ToString());
        SqlCommand cmd = new SqlCommand("Select * from Category", con);
        DataTable tb = new DataTable();
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        tb.Load(dr, LoadOption.OverwriteChanges);
        con.Close();
        return tb;
    }
    public static DataTable GetSales()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ToString());
        string query = "SELECT TOP 3 CONVERT(NVARCHAR(7),PaymentDate,120) [Month], SUM(Amount) [TotalAmount]";
        query += " FROM Sales";
        query += " GROUP BY CONVERT(NVARCHAR(7),PaymentDate,120)";
        query += " ORDER BY [Month] ASC;";
        SqlCommand cmd = new SqlCommand(query, con);
        DataTable tb = new DataTable();

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        tb.Load(dr, LoadOption.OverwriteChanges);
        con.Close();
        return tb;
    }
    public static int GetDecryptedTokenEmailFromDataBase(string decryptedToken)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM Accounts WHERE Email = @email";
        SqlCommand com = new SqlCommand(checkuser, conn);
        string email = Encoding.ASCII.GetString(Convert.FromBase64String(decryptedToken)).Substring(8);
        com.Parameters.AddWithValue("@email", email);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();
        return temp;
    }
    public static void ChangeUserPasswordDB(string email, string password)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();

        SqlCommand command = new SqlCommand("update Accounts set password = @pass where email = @email", conn);
        command.Parameters.AddWithValue("@pass", password);
        command.Parameters.AddWithValue("@email", email);
        command.ExecuteNonQuery();

        conn.Close();
    }
    public static void UpdateUserAddress(string TextBox_Email, string TextBox_Address1, string TextBox_Address2, string TextBox_Zipcode)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        using (SqlCommand command = new SqlCommand("update [accounts] set address1=@addr1, address2=@addr2, zipcode=@zipcode WHERE email = @email", conn))
        {
            //checks if the email that the user has entered exists in the database table
            command.Parameters.AddWithValue("email", TextBox_Email);
            command.Parameters.AddWithValue("@addr1", TextBox_Address1);
            command.Parameters.AddWithValue("@addr2", TextBox_Address2);
            command.Parameters.AddWithValue("zipcode", TextBox_Zipcode);
            command.ExecuteNonQuery();
        }
        conn.Close();
    }
    public static void RegisterUser(string TextBox_Email, dynamic TextBox_Address1, dynamic TextBox_Address2, dynamic TextBox_Zipcode, string TextBox_FirstName, string TextBox_LastName, string TextBox_MobileNumber, string password)
    {
        using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            sqlConnection.Open();
            string query = "INSERT INTO accounts (Id, first_name, last_name, email, emailConfirmed, isAdmin, password, mobile_number, multi_factor_enabled, secret_key, address1, address2, zipcode) values (@id, @first, @last, @email, @emailConfirmed, @admin, @password, @mobile, @multi_factor_enabled, @secret_key, @address1, @address2, @zipcode)";
            SqlCommand com = new SqlCommand(query, sqlConnection);
            com.Parameters.AddWithValue("@id", Guid.NewGuid().ToString());
            com.Parameters.AddWithValue("@first", TextBox_FirstName);
            com.Parameters.AddWithValue("@last", TextBox_LastName);
            com.Parameters.AddWithValue("@email", TextBox_Email);
            com.Parameters.AddWithValue("@emailConfirmed", false);
            com.Parameters.AddWithValue("@admin", false);
            com.Parameters.AddWithValue("@password", password);
            com.Parameters.AddWithValue("@mobile", TextBox_MobileNumber);
            com.Parameters.AddWithValue("@multi_factor_enabled", false);
            com.Parameters.AddWithValue("@secret_key", DBNull.Value);
            com.Parameters.AddWithValue("@address1", TextBox_Address1);
            com.Parameters.AddWithValue("@address2", TextBox_Address2);
            com.Parameters.AddWithValue("@zipcode", TextBox_Zipcode);
            com.ExecuteNonQuery();
        }
    }
    public static void SaveCountryToDatabase(string countryISO)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

        conn.Open();
        SqlCommand com = new SqlCommand($"SELECT COUNT(*) FROM countries WHERE country = '{countryISO}'", conn);

        int countryexists = Convert.ToInt32(com.ExecuteScalar().ToString());
        // If country exists update count else create new row
        if (countryexists == 1)
        {
            com.CommandText = $"update Countries set count=count+1 where country='{countryISO}'";
            com.ExecuteNonQuery();
        }
        else
        {
            com.CommandText = $"INSERT INTO countries (Id, country, count) values ('{Guid.NewGuid().ToString()}', '{countryISO}', 1)";
            com.ExecuteNonQuery();
        }
        conn.Close();
    }

    public static void AddDataToSalesTable(double subtotal)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            conn.Open();
            string checkuser = "SELECT COUNT(*) FROM Sales WHERE paymentdate = @today";
            SqlCommand command = new SqlCommand(checkuser, conn);
            command.Parameters.AddWithValue("@today", DateTime.Now.Date);

            int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
            if (temp == 1)
            {
                // update data
                command.CommandText = $"update sales set amount=amount+{subtotal + 50} where paymentdate=@today";
                command.ExecuteNonQuery();
            }
            else
            {
                // create new record
                command.CommandText = $"insert into sales (id, paymentdate, amount) values ('{Guid.NewGuid().ToString()}', @today, {subtotal + 50})";
                command.ExecuteNonQuery();
            }
        }
    }
    public static void AddCategoriesTableDB(dynamic carts)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            conn.Open();
            foreach (KeyValuePair<string, Cart> kvp in carts)
            {

                string query = "update Category set count=1 where id = " +
                    "(Select Category.Id from Clothes inner join Category on Clothes.category_id = Category.Id " +
                    $"where Clothes.Id = '{kvp.Value.clothes_id}')";

                SqlCommand command = new SqlCommand(query, conn);
                command.ExecuteNonQuery();
            }
        }
    }

    public static Repeater DisplayNewClothing(Repeater repeater)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            using (SqlCommand sql = new SqlCommand("select top 6 * from Clothes order by DateAdded desc", conn))
            {
                conn.Open();
                SqlDataReader dataTable = sql.ExecuteReader();
                repeater.DataSource = dataTable;
                repeater.DataBind();
            }
        }
        return repeater;
    }
    public static Repeater DisplayRandomClothing(Repeater repeater)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            using (SqlCommand sql = new SqlCommand("select * from Clothes where Id in (select top 6 Id from Clothes order by newid())", conn))
            {
                conn.Open();
                SqlDataReader dataTable = sql.ExecuteReader();
                repeater.DataSource = dataTable;
                repeater.DataBind();
            }
        }
        return repeater;
    }
    public static int CheckIfUserExists(string email)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM Accounts WHERE Email = @email";
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", email);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();
        return temp;
    }
    public static string GetUserPassword(string TextBox_Email)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();

        string checkPasswordQuery = "SELECT password FROM Accounts WHERE email = @email2";

        SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
        pwcomm.Parameters.AddWithValue("@email2", TextBox_Email);
        string password = pwcomm.ExecuteScalar().ToString();
        return password;
        
    }
    public static DataSet GetMenTops() {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            SqlDataAdapter sql = new SqlDataAdapter("select * from Clothes where gender = 'M' and category_id in (5,6,7,8)", conn);
            DataSet temp = new DataSet();
            sql.Fill(temp);
            return temp;
        }
    }
    public static DataSet GetMenBottoms()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            SqlDataAdapter sql = new SqlDataAdapter("select * from Clothes where gender = 'M' and category_id in (1,2,3,4)", conn);
            DataSet temp = new DataSet();
            sql.Fill(temp);
            return temp;
        }
    }
    public static Repeater ProductListCategory(Repeater repeater, char gender, int category_id) {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            SqlDataAdapter sql = new SqlDataAdapter($"select * from Clothes where gender = '{gender}' and category_id in ({category_id})", conn);
            DataSet temp = new DataSet();
            sql.Fill(temp);
            repeater.DataSource = temp;
            repeater.DataBind();
        }
        return repeater;
    }
    public static DataSet GetWomenTops()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            SqlDataAdapter sql = new SqlDataAdapter("select * from Clothes where gender = 'F' and category_id in (11,12,13,7,8)", conn);
            DataSet temp = new DataSet();
            sql.Fill(temp);
            return temp;
        }
    }
    public static DataSet GetWomenBottoms()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))
        {
            SqlDataAdapter sql = new SqlDataAdapter("select * from Clothes where gender = 'F' and category_id in (2,9,3,4,10)", conn);
            DataSet temp = new DataSet();
            sql.Fill(temp);
            return temp;
        }
    }

    public static int AnyResultsFromSearch(string search_input)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        string checksearch = "SELECT COUNT(*) FROM [Clothes] WHERE name LIKE @search OR overview LIKE @search";
        SqlCommand command = new SqlCommand(checksearch, conn);

        //declare @search
        command.Parameters.AddWithValue("@search", "%" + search_input + "%");
        //command.Parameters["@search"].Value = "%" + search_input + "%";

        //use temp to create a fucntion
        int temp = Convert.ToInt32(command.ExecuteScalar().ToString());

        //close the connection
        conn.Close();
        return temp;
    }
    public static Repeater GetResultFromSearch(Repeater repeater, string search_input)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        string checksearch = "SELECT * FROM [Clothes] WHERE name LIKE @search OR overview LIKE @search";
        SqlCommand command = new SqlCommand(checksearch, conn);
        command.Parameters.AddWithValue("@search", "%" + search_input + "%");

        SqlDataReader dataTable = command.ExecuteReader();
        repeater.DataSource = dataTable;
        repeater.DataBind();

        //close the connection
        conn.Close();

        return repeater;
    }

    public static void UpdateUserInformation(string TextBox_Firstname, string TextBox_Lastname, string TextBox_MobileNumber, string TextBox_Address1, string TextBox_Address2, string TextBox_Zipcode,string email)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();

        SqlCommand command = new SqlCommand("update Accounts set first_name = @fn, last_name = @ln, mobile_number = @mn, address1 = @ad1, address2 = @ad2, zipcode = @zc where email = @email", conn);
        command.Parameters.AddWithValue("@fn", TextBox_Firstname);
        command.Parameters.AddWithValue("@ln", TextBox_Lastname);
        command.Parameters.AddWithValue("@mn", TextBox_MobileNumber);
        command.Parameters.AddWithValue("@ad1", TextBox_Address1);
        command.Parameters.AddWithValue("@ad2", TextBox_Address2);
        command.Parameters.AddWithValue("@zc", TextBox_Zipcode);
        command.Parameters.AddWithValue("@email", email);
        command.ExecuteNonQuery();
    }
    public static void UpdateUserPassword(string email, string password)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();

        SqlCommand command = new SqlCommand("update Accounts set password = @pw where email = @email", conn);
        command.Parameters.AddWithValue("@email", email);
        command.Parameters.AddWithValue("@pw", password);
        command.ExecuteNonQuery();
    }

    public static bool UserAlreadyCreatedReview(string product_id, dynamic email)
    {
        if (email == null) return false;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Ratings WHERE account_id = @aid AND product_id = @pid", conn);
        command.Parameters.AddWithValue("@aid", Account.GetAccount(email.ToString()).id);
        command.Parameters.AddWithValue("@pid", product_id);
        return Convert.ToInt32(command.ExecuteScalar().ToString()) == 0 ? false : true;
    }
    public static string GetUserFullnameByAccountID(string account_id)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from Accounts WHERE id = @aid", conn);
        cmd.Parameters.AddWithValue("@aid", account_id);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        string name = "";
        if (dr.Read())
        {
            name = dr["first_name"].ToString() + " " + dr["last_name"].ToString();
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return name;
    }
    public static DataTable GetAverageRating(string product_id)
    {
        // SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) " + "RatingCount FROM [RATINGS] WHERE Title = @booktitle
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        //return command.ExecuteScalar().ToString();
        SqlDataAdapter dataAdapter = new SqlDataAdapter($"SELECT ISNULL(AVG(stars), 0) as averageRating FROM Ratings WHERE product_id = '{product_id}'", conn);
        DataTable dt = new DataTable();
        dataAdapter.Fill(dt);
        return dt;
    }
    public static string GetAllReviewsCount(string product_id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Ratings WHERE product_id = @pid", conn);
        command.Parameters.AddWithValue("@pid", product_id);
        return command.ExecuteScalar().ToString();
    }
    public static DataSet GetAllReviews(string product_id)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from Ratings WHERE product_id = @pid", conn);
        cmd.Parameters.AddWithValue("@pid", product_id);

        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        // Creating dataset, and all the columns name for the repeater
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ds.Tables.Add(dt);
        dt.Columns.Add("name");
        dt.Columns.Add("review");

        while (dr.Read())
        {
            DataRow dataRow = dt.Rows.Add();
            string name = GetUserFullnameByAccountID(dr["account_id"].ToString());
            dataRow.SetField("name", name);
            dataRow.SetField("review", dr["review"]);
        }

        conn.Close();
        dr.Close();
        dr.Dispose();
        return ds;
    }
    public static void UpdateUserReview(string TextBox_ReviewDescription, string stars, string email, string id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UPDATE RATINGS SET review = @review, stars=@stars WHERE account_id = @aid AND product_id = @pid", conn);
        //SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@review", TextBox_ReviewDescription);
        cmd.Parameters.AddWithValue("@stars", stars);
        cmd.Parameters.AddWithValue("@aid", Account.GetAccount(email.ToString()).id);
        cmd.Parameters.AddWithValue("@pid", id);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public static void AddUserReview(string TextBox_ReviewDescription, string stars, string email, string id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO [RATINGS] (Id, account_id, product_id, stars, review) VALUES (@id, @ac_id, @pd_id, @stars,@review)", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", Guid.NewGuid().ToString());
        cmd.Parameters.AddWithValue("@ac_id", Account.GetAccount(email).id);
        cmd.Parameters.AddWithValue("@pd_id", id);
        cmd.Parameters.AddWithValue("@stars", stars);
        cmd.Parameters.AddWithValue("@review", TextBox_ReviewDescription);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public static string[] ShowAllRatings(string aid, string pid)
    {
        string[] ReturnValue = new string[2];
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        conn.Open();
        //SqlCommand command = new SqlCommand("SELECT review FROM Ratings WHERE account_id = 'a379c844-fa66-4103-958f-59cfc2424e23' AND product_id = '1db01a98-4f62-49dc-8fe5-0b789a89386a'", conn);
        SqlCommand command = new SqlCommand("SELECT review, stars FROM Ratings WHERE account_id = @aid AND product_id = @pid", conn);
        command.Parameters.AddWithValue("@aid", aid);
        command.Parameters.AddWithValue("@pid", pid);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            ReturnValue[0] = reader[0].ToString();
            ReturnValue[1] = reader[1].ToString();
        }
        conn.Close();
        return ReturnValue;
    }

    /// <summary>
    /// ALL MAIL STUFF
    /// </summary>
    public static void SendMail(string email, string subject, string body)
    {
        var my_email = "projecttestemail504@gmail.com";
        var my_password = "zdml pmeu mhzj gsgn";// "bqrg wkii qwwk xqhb";


        SmtpClient smtpclient = new SmtpClient("smtp.gmail.com", 587);
        //smtpclient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpclient.EnableSsl = true;


        smtpclient.Credentials = new  NetworkCredential(my_email, my_password);
        //smtpclient.UseDefaultCredentials = false;
        
        
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(my_email, "PP Slayer");
        mail.To.Add(new MailAddress(email));

        mail.Subject = subject;
        mail.IsBodyHtml = true;
        mail.Body = body;

        smtpclient.Send(mail);
    }
}