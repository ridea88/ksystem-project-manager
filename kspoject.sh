#!/bin/bash

PRT_DIR="$HOME/prt9000"
PROJECT_DIR="$HOME/Music/ksprojects"

mkdir -p "$PROJECT_DIR"
mkdir -p "$PRT_DIR/template"

while true
do

clear
echo "==========================="
echo " KSYSTEM PROJECT MANAGER"
echo "==========================="

mapfile -t projects < <(ls "$PROJECT_DIR")

if [ ${#projects[@]} -eq 0 ]; then
echo "Belum ada project"
echo ""
echo "1) Buat Project Baru"
echo "0) Keluar"
read -p "Pilih: " act

if [ "$act" == "1" ]; then
read -p "Nama project: " pname
mkdir -p "$PROJECT_DIR/$pname"
fi

if [ "$act" == "0" ]; then
exit
fi

continue
fi

for i in "${!projects[@]}"
do
num=$((i+1))
echo "$num) ${projects[$i]}"
done

echo ""
echo "n) Buat Project Baru"
echo "0) Keluar"
echo "==========================="

read -p "Pilih project: " pilih

if [ "$pilih" == "0" ]; then
clear
exit
fi

if [ "$pilih" == "n" ]; then
read -p "Nama project: " pname
mkdir -p "$PROJECT_DIR/$pname"
continue
fi

index=$((pilih-1))

if [ -z "${projects[$index]}" ]; then
echo "Pilihan tidak valid"
sleep 2
continue
fi

pname="${projects[$index]}"

while true
do

clear
echo "==========================="
echo " Project: $pname"
echo "==========================="

mapfile -t files < <(ls "$PROJECT_DIR/$pname")

if [ ${#files[@]} -eq 0 ]; then
echo "Belum ada file di project ini"
echo ""
echo "0) Kembali"
read -p "Pilih: " back
break
fi

for i in "${!files[@]}"
do
num=$((i+1))
echo "$num) ${files[$i]}"
done

echo "0) Kembali"
echo "==========================="

read -p "Pilih file: " pilihfile

if [ "$pilihfile" == "0" ]; then
break
fi

index=$((pilihfile-1))

if [ -z "${files[$index]}" ]; then
echo "Pilihan tidak valid"
sleep 2
continue
fi

sctfile="${files[$index]}"

echo ""
echo "File dipilih: $sctfile"

# jika file diawali tmp_
if [[ $sctfile == tmp_* ]]; then

echo "Template file terdeteksi"
echo "Copy ke prt9000/template..."

cp "$PROJECT_DIR/$pname/$sctfile" "$PRT_DIR/template/"

echo "Template dicopy (tidak diparser)"

else

echo "Copy ke prt9000..."

cp "$PROJECT_DIR/$pname/$sctfile" "$PRT_DIR/"

echo "Parsing..."

cd "$HOME"
kspar -n -l prt9000/$sctfile

fi

echo ""
echo "Selesai"
read -p "Tekan ENTER..."

done

done
