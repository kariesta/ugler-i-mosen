#åpner undermappen.
#kompiler alle filer og kjør dem
#ignorer "finner ikke main" errors, meld ifra om resten, i .txt fil i mappen.
openAndRun(){
  for d in */; do
    echo ${d}
    if [[ -d "${d}" ]]; then
      #åpne dir og kjør filer
      #javac *java
      #java $2 2> error.log
      #hvis feilmelding return 0, else return 1
      return 0
    else
      return 1
    fi
  done
}



#tar inn innleveringenes full path og åpner den.
cd $1
#åpner hver mappe, og lagrer mappenavnet.
for d in */; do
  echo ${d}
  cd ${d}
  if openAndRun; then
    #save d to file.
    echo $d >> ugler_i_mosen.txt
  fi
  cd $1
done
#åpner undermappen.
#kompiler alle filer og kjør dem
#ignorer "finner ikke main" errors, meld ifra om resten, i .txt fil i mappen.
#legg navnet i listen for rettede oppgaver
#sitt igjen med en liste på brukernavn for studentmappene med feil
