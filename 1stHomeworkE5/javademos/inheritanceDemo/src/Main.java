public class Main {
    public static void main(String[] args) {

        KrediUI krediUI = new KrediUI();

        krediUI.KrediHesapla(new AskerKrediManager());
        krediUI.KrediHesapla(new OgretmenKrediManager());
//        OgretmenKrediManager ogretmenKrediManager = new OgretmenKrediManager();
//        ogretmenKrediManager.Hesapla();
        krediUI.KrediHesapla(new TarımKrediManager());
    }
}