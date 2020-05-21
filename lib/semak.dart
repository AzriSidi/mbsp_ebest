class Semak {
    String _tkh_siasat,_masa_siasat ,_waktu_siasat,_jenis_salah,_no_premis,_no_lot, 
    _jalan,_lokasi,_bandar,_daerah,_mukim,_parlimen,_dun,_kordinat1,_kordinat2,
    _namapemilik,_binaan_jenis;

    Semak(this._tkh_siasat,this._masa_siasat,this._waktu_siasat,this._jenis_salah,
          this._no_premis,this._no_lot,this._jalan,this._lokasi,this._bandar,
          this._daerah,this._mukim,this._parlimen,this._dun,this._kordinat1,
          this._kordinat2,this._namapemilik,this._binaan_jenis);

    get tkhSiasat => this._tkh_siasat;
    get masaSiasat => this._masa_siasat;
    get waktuSiasat => this._waktu_siasat;
    get jenisSalah => this._jenis_salah;
    get noPremis => this._no_lot;
    get jalan => this._jalan;
    get lokasi => this._lokasi;
    get bandar => this._bandar;
    get daerah => this._daerah;
    get mukim => this._mukim;
    get parlimen => this._parlimen;
    get dun => this._dun;
    get kordinat1 => this._kordinat1;    
    get kordinat2 => this._kordinat2;
    get namaPemilik => this._namapemilik;
    get binaanJenis => this._binaan_jenis;
}