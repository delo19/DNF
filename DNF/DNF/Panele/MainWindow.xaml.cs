using DNF.Other;
using DNF.Panele;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DNF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Setup();
        }

        private void Setup()
        {
            zalogowanyTb.Text = Session.zalogowanyUzytkownik.Login;
            switch (Session.zalogowanyUzytkownik.Rola)
            {
                case 0: typTb.Text = "Uczestnik"; break;
                case 1: typTb.Text = "Dziekanat"; break;
                case 2: typTb.Text = "Prowadzący"; break;
                case 3: typTb.Text = "Administrator"; break;
                default: typTb.Text = "Uczestnik"; break;
            }

        }

        private void DajWydarzenia(object sender, RoutedEventArgs e)
        {
            content.Children.Clear();
            content.Children.Add(new ListaWydarzen());
        }
    }
}
