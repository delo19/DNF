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
    /// Interaction logic for ZapiszNaWydarzenie.xaml
    /// </summary>
    public partial class ZapiszNaWydarzenie : UserControl
    {
        private bool editMode;

        public ZapiszNaWydarzenie()
        {
            InitializeComponent();
        }

        public ZapiszNaWydarzenie(bool editMode)
        {
            InitializeComponent();
            this.editMode = editMode;
            if (editMode)//pokaz edit, ukryj zapisz
            {
                
            }
            else
            {

            }
        }

        private void edytujBtn_Click(object sender, RoutedEventArgs e)
        {
            var ob = this.Parent;
            (this.Parent as Grid).Children.Clear();
            (ob as Grid).Children.Add(new DodajWydarzenie(true));
            return;
        }

        private void usunBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
