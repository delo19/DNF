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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DNF.Panele
{
    /// <summary>
    /// Interaction logic for ListaWydarzen.xaml
    /// </summary>
    public partial class ListaWydarzen : UserControl
    {

        public ListaWydarzen()
        {
            InitializeComponent();
            listaWydarzenGrid.ItemsSource = ManagerLogic.DajWydarzenia();

        }

        private void listaWydarzenGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Session.aktualneWydarzenie = listaWydarzenGrid.SelectedItem as events;

            if (Session.zalogowanyUzytkownik.Rola == 0)//uzytkownik
            {
                var ob = this.Parent;
                (this.Parent as Grid).Children.Clear();
                (ob as Grid).Children.Add(new ZapiszNaWydarzenie(true));
                return;
            }
            else//dziekanat lub prowadzacy lub admin
            {
                var ob = this.Parent;
                (this.Parent as Grid).Children.Clear();
                (ob as Grid).Children.Add(new ZapiszNaWydarzenie(false));
                return;
            }

        }
    }
}
