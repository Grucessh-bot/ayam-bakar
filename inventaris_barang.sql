CREATE TABLE Admin (
    ID_Admin VARCHAR(10) PRIMARY KEY,
    Nama_Admin VARCHAR(100) NOT NULL,
    Username_Admin VARCHAR(50) NOT NULL,
    Password_Admin VARCHAR(255) NOT NULL,
    No_Telepon_Admin VARCHAR(20)
);

CREATE TABLE Petugas_Gudang (
    ID_Petugas VARCHAR(10) PRIMARY KEY,
    Nama_Petugas VARCHAR(100) NOT NULL,
    Shift VARCHAR(20),
    Username_Petugas VARCHAR(50) NOT NULL,
    Password_Petugas VARCHAR(255) NOT NULL
);

CREATE TABLE Barang (
    ID_Barang VARCHAR(10) PRIMARY KEY,
    Nama_Barang VARCHAR(100) NOT NULL,
    Kategori_Barang VARCHAR(100),
    Satuan VARCHAR(20),
    Harga_Satuan DECIMAL(12,2),
    Stok_Saat_Ini INT DEFAULT 0,
    Stok_Minimum INT DEFAULT 0
);

CREATE TABLE Pemasok (
    ID_Pemasok VARCHAR(10) PRIMARY KEY,
    Nama_Pemasok VARCHAR(100) NOT NULL,
    Alamat_Pemasok TEXT,
    No_Telepon_Pemasok VARCHAR(20),
    Email_Pemasok VARCHAR(100)
);

CREATE TABLE Transaksi_Barang_Masuk (
    ID_Masuk VARCHAR(10) PRIMARY KEY,
    ID_Pemasok VARCHAR(10),
    ID_Admin VARCHAR(10),
    Tgl_Masuk DATE,
    Keterangan TEXT,
    
    FOREIGN KEY (ID_Pemasok)
        REFERENCES Pemasok(ID_Pemasok),

    FOREIGN KEY (ID_Admin)
        REFERENCES Admin(ID_Admin)
);

CREATE TABLE Detail_Transaksi_Masuk (
    ID_Detail_Masuk VARCHAR(10) PRIMARY KEY,
    ID_Masuk VARCHAR(10),
    ID_Barang VARCHAR(10),
    Jumlah_Masuk INT,
    Harga_Per_Satuan DECIMAL(12,2),

    FOREIGN KEY (ID_Masuk)
        REFERENCES Transaksi_Barang_Masuk(ID_Masuk),

    FOREIGN KEY (ID_Barang)
        REFERENCES Barang(ID_Barang)
);

CREATE TABLE Transaksi_Barang_Keluar (
    ID_Keluar VARCHAR(10) PRIMARY KEY,
    ID_Barang VARCHAR(10),
    ID_Petugas VARCHAR(10),
    Tgl_Keluar DATE,
    Jumlah_Keluar INT,
    Tujuan_Penggunaan VARCHAR(255),
    Keterangan TEXT,

    FOREIGN KEY (ID_Barang)
        REFERENCES Barang(ID_Barang),

    FOREIGN KEY (ID_Petugas)
        REFERENCES Petugas_Gudang(ID_Petugas)
);