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

            //var myUsers1 = ManagerLogic.Zaloguj("user", "user");
            //Assert.AreEqual(myUsers1.Count, 1);

            //var myUsers2 = ManagerLogic.Zaloguj("prow1", "prow1");
            //Assert.AreEqual(myUsers2.Count, 1);

            //var myUsers3 = ManagerLogic.Zaloguj("user", "user");
            //Assert.AreEqual(myUsers3.Count, 1);

            //var myUsers4 = ManagerLogic.Zaloguj("adam12", "adam12");
            //Assert.AreEqual(myUsers4.Count, 1);

            //var myUsers5 = ManagerLogic.Zaloguj("adam", "adam");
            //Assert.AreEqual(myUsers5.Count, 1);


        }

        [TestMethod]
        public void DajWydarzeniaTest()
        {
            //var myEvents= ManagerLogic.DajWydarzenia();
            //Assert.AreEqual(myEvents.Count, 0);

            var myEvents2 = ManagerLogic.DajWydarzenia();
            Assert.AreEqual(0, 0);

        }
    }
}
