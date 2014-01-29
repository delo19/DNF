using DNF.Database;
using DNF.Other;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DNF.Panele
{
    /// <summary>
    /// Interaction logic for Logowanie.xaml
    /// </summary>
    public partial class Logowanie : Window
    {
        public Logowanie()
        {
            InitializeComponent();
        }

        private void zaloguj(object sender, RoutedEventArgs e)
        {

                var user = ManagerLogic.Zaloguj(loginTb.Text, hasloTb.Password); 
                if (user != null && user.Count() > 0)
                {
                    Other.Session.zalogowanyUzytkownik = user.First();
                    (new MainWindow()).Show();
                    this.Close();

                }
                else
                    MessageBox.Show("Dane logowania nieprawidlowe");
            
        }
    }
}
