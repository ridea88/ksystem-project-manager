# 🚀 KSystem Project Manager

Tool Bash sederhana untuk membantu manage file `.sct` dan parsing menggunakan `kspar`.

---

## ⚙️ Cara Install

### 1. Clone repository


git clone https://github.com/ridea88/ksystem-project-manager.git
cd ksystem-project-manager


### 2. Beri permission executable


chmod +x kspoject.sh


### 3. (Opsional) Install ke global

Agar bisa dijalankan dari mana saja:


mv kspoject.sh ~/bin/ksproject


Pastikan folder `~/bin` ada di PATH:


export PATH="$HOME/bin:$PATH"


## ▶️ Cara Menjalankan

Jika belum install global:


./kspoject.sh


Jika sudah:


ksproject


---

## 🧠 Cara Penggunaan

### 1. Pilih atau buat project

* Pilih nomor project yang tersedia
* Atau tekan `n` untuk membuat project baru

---

### 2. Pilih file

* Pilih nomor file `.sct` yang ingin diproses

---

### 3. Proses otomatis

#### Jika file biasa (contoh: `sct686`)


→ Copy ke ~/prt9000/
→ Jalankan kspar


#### Jika file template (prefix: `tmp_`)

→ Copy ke ~/prt9000/template/
→ Tidak diparse


---

## ⚡ Contoh Singkat

1. Simpan file di project:


~/Music/ksprojects/project1/sct686


2. Jalankan:


ksproject


3. Pilih:

* project
* file

4. Script akan otomatis:


copy → prt9000 → kspar


---

