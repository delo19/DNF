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
    /// Interaction logic for ZapiszNaWydarzenie.xaml
    /// </summary>
    public partial class ZapiszNaWydarzenie : UserControl
    {
        private bool editMode;

        public ZapiszNaWydarzenie()
        {
            InitializeComponent();
            Setup();
        }

        public ZapiszNaWydarzenie(bool editMode)
        {
            InitializeComponent();
            this.editMode = editMode;
            if (editMode)//pokaz edit, ukryj zapisz
            {
                edytujBtn.Visibility = Visibility.Hidden;
                usunBtn.Visibility = Visibility.Hidden;
            }
            else
            {
                zapiszBtn.Visibility = Visibility.Hidden;
                wypiszBtn.Visibility = Visibility.Hidden;
            }
            Setup();
        }

        private void Setup()
        {
            nazwaTb.Text = Session.aktualneWydarzenie.Nazwa;
            opisTbtext.Text = Session.aktualneWydarzenie.Opis;
            dataTb.SelectedDate = Session.aktualneWydarzenie.Data;
            iloscMiejscTb.Text = Session.aktualneWydarzenie.IloscMiejsc.ToString();
            kategriaWiekowaTb.Text = Session.aktualneWydarzenie.KategoriaWiekowa.ToString();
            miejsceTb.Text = Session.aktualneWydarzenie.Miejsce;
            iloscMiejscWolnychTb.Text = Session.aktualneWydarzenie.IloscWolnych.ToString();
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

            // Configure the message box to be displayed
            string messageBoxText = "Czy na pewno chcesz wykonać akcję?";
            string caption = "Potwierdzenie";
            MessageBoxButton button = MessageBoxButton.YesNoCancel;
            MessageBoxImage icon = MessageBoxImage.Warning;

            // Display message box
            MessageBoxResult result = MessageBox.Show(messageBoxText, caption, button, icon);

            // Process message box results
            switch (result)
            {
                case MessageBoxResult.Yes:
                    ManagerLogic.SkasujWydarzenie(Session.aktualneWydarzenie);
                    break;
                case MessageBoxResult.No:
                    break;
                case MessageBoxResult.Cancel:
                    break;
            }

            
        }

        private void zapiszBtn_Click(object sender, RoutedEventArgs e)
        {
            if (Session.aktualneWydarzenie.IloscWolnych == 0)
            {
                MessageBox.Show("brak wolnych miejsc!", "Bląd");
                return;
            }
            if (Session.aktualneWydarzenie.KategoriaWiekowa > Session.zalogowanyUzytkownik.Wiek)
            {
                MessageBox.Show("Zla kategoria wiekowa!", "Bląd");
                return;
            }
            registers reg = new registers();
            reg.EventId = Session.aktualneWydarzenie.Id;
            reg.User = Session.zalogowanyUzytkownik.Login;
            ManagerLogic.Zarejestruj(reg);
            MessageBox.Show("Zarejestrowano!!", "Sukces");
            Session.aktualneWydarzenie.IloscWolnych -= 1;
            ManagerLogic.EdytujWydarzenie(Session.aktualneWydarzenie.Id, Session.aktualneWydarzenie);

        }
    }
}
