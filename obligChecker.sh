#tar inn 2 parametere $1=path for nedlastning fra devilry, $2=navn på kjørbart program.

#tar inn innleveringenes full path og åpner den.
cd $1
#åpner hver students mappe og innleveringsmappen der.
for d in */; do
  cd $d
  cd * #har brukt $3 for spesifikk mappe hvis flere.
  #kompilerer alle java-filer. lagrer evt. feilmelding.
  for j in *java; do
    if [[ "${j}"=~"\w\.java" ]]; then
      javac $j 2>> compilorerror.log
    fi
  done
  #kjør et program med innsendt navn og lagrer output og evt. feilmeldinger.
  java $2 1> output.txt 2> error.log
  #Hvis det finnes feilmeldinger legg  navnet i filen ugler_i_mosen.txt i mappen innsendt som $1.
  if [[ -s "error.log" ]]; then
    echo $d >> ../../ugler_i_mosen.txt
  elif [[ -s "compilorerror.log" ]]; then
    echo $d >> ../../ugler_i_mosen.txt
  fi
  #Oppretter .md-fil for tilbakemeldinger basert på en mal.
  #touch "${d%/}-feedback.md"
  cp "../../template.md" "${d%/}-feedback.md"
  cd "../.."
done
