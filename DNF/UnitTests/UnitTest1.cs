using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DNF.Other;

namespace UnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void LogowanieTest()
        {
            var myUsers= ManagerLogic.Zaloguj("elo", "elo");
            Assert.AreEqual(myUsers.Count,1);

        }

        [TestMethod]
        public void DajWydarzeniaTest()
        {
            var myUsers = ManagerLogic.Zaloguj("elo", "elo");
            Assert.AreEqual(myUsers.Count, 1);

        }
    }
}
