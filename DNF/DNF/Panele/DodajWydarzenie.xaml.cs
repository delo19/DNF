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
    /// Interaction logic for DodajWydarzenie.xaml
    /// </summary>
    public partial class DodajWydarzenie : UserControl
    {
        private bool isEditMode;

        public DodajWydarzenie()
        {
            InitializeComponent();
        }

        public DodajWydarzenie(bool editMode)
        {
            InitializeComponent();
            this.isEditMode = editMode;
            if (editMode)
            {

                nazwaTb.Text = Session.aktualneWydarzenie.Nazwa;
                opisTbtext.Text = Session.aktualneWydarzenie.Opis;
                dataTb.SelectedDate = Session.aktualneWydarzenie.Data;
                iloscMiejscTb.Text = Session.aktualneWydarzenie.IloscMiejsc.ToString();
                kategriaWiekowaTb.Text = Session.aktualneWydarzenie.KategoriaWiekowa.ToString();
                flagatb.Text = "Edytuj wydarzenie";
                miejsceTb.Text = Session.aktualneWydarzenie.Miejsce;
            }
            else
            {
                flagatb.Text = "Dodaj wydarzenie";
            }
        }

        //Zapis do bazy
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
            try
            {
                if (dataTb.SelectedDate == null)
                {
                    MessageBox.Show("Nieprawidłowa godzina", "Błąd");
                    return;
                }

                events ev = new events();
                ev.Nazwa =
                ev.Nazwa = nazwaTb.Text;
                ev.Opis = opisTbtext.Text;
                ev.Data = (DateTime)dataTb.SelectedDate;
                ev.IloscWolnych = ev.IloscMiejsc = long.Parse(iloscMiejscTb.Text);
                ev.KategoriaWiekowa = long.Parse(kategriaWiekowaTb.Text);
                ev.Miejsce = miejsceTb.Text;

                bool infected = false;
                foreach (var item in ManagerLogic.SzukajWydarzeniaProwadzacy( Session.zalogowanyUzytkownik.Login))
                {
                    if (item.Data == ev.Data && item.Id != ev.Id)
                    {
                        MessageBox.Show("Masz wydarzenie o tej porze!", "Błąd");
                        infected = true;
                        return;
                    }
                    if (item.Miejsce.Equals(ev.Miejsce) && item.Id != ev.Id)
                    {
                        MessageBox.Show("Sala jest zajęta!", "Błąd");
                        infected = true;
                        return;
                    }


                }

                if (!infected)
                {
                    if (isEditMode)
                    {
                        ManagerLogic.EdytujWydarzenie(Session.aktualneWydarzenie.Id,ev);
                        MessageBox.Show("Zaktualizowano wydarzenie", "Sukces");
                    }
                    else
                    {
                        ManagerLogic.DodajWydarzenie(ev);
                        MessageBox.Show("Dodano wydarzenie", "Sukces");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Podane dane nie są pełne!", "Błąd");
            }
        }



    }
}
