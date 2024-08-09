using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Configuration;
using AWAD_Assignment;
using AWAD_Assignment.routes;
using Salt_Password_Sample;
namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestInitialize]
        public void TestInitialize()
        {
            // Mock or initialize the necessary resources
        }

        [TestMethod]
        public void TestMethod1()
        {
            var email = "admin@email.com"; 

            // Call the method and store the result
            var result = Function.CheckIfUserExists(email);

            // Add your assertions here based on the expected result
           Assert.IsTrue( result == 1); // Or whatever your expected result is
        }

        
        [TestMethod]
        public void TestMethod2()
        {
            var a = Function.IsUserAdmin("admin@email.com");
            Assert.AreEqual( "True", a );
        }

        [TestMethod]
        public void TestMethod3()
        {
            //C
            var email = "TestingAccount@email.com";
            Function.RegisterUser(email,DBNull.Value,DBNull.Value,DBNull.Value,"tom","lee","85069025",Hash.ComputeHash("testpassword", "SHA512", null));

            var result = Function.CheckIfUserExists(email);
            Assert.IsTrue(result == 1);
        }

        [TestMethod]
        public void TestMethod4()
        {
            //U
            var ema = "TestingAccount@email.com";
            Function.SetUserVerificationTrue(ema);
            var acc =Account.GetAccount(ema);
            Assert.IsTrue(acc.emailConfirmed == true);
        }
        [TestMethod]
        public void TestMethod5() {
            // Del
            var email = "TestingAccount@email.com";
            Function.RemoveUserVoid(email);
            var result = Function.CheckIfUserExists(email);
            Assert.IsTrue(result == 0);
        }
    }


}