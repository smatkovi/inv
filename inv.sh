#!/bin/bash

# Überprüfen, ob ein PDF-Datei als Argument übergeben wurde
if [ $# -ne 1 ]; then
  echo "Bitte gib eine PDF-Datei als Argument an."
  exit 1
fi

# Namen des Ausgabedokuments erstellen
input_pdf="$1"
output_pdf="${input_pdf%.*}_Inv.${input_pdf##*.}"

# Farben invertieren mit Ghostscript
gs -o "$output_pdf" -sDEVICE=pdfwrite -c "{1 exch sub} settransfer" -f "$input_pdf"
   

# Bestätigung ausgeben
echo "Farben invertiert. Neue Datei: $output_pdf"
