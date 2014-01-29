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
            }
        }
        


    }
}
