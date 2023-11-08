 #!/bin/bash
 
 PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

  if [[ $1 ]]
  then
    #checar si variable es numero
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      #buscar elemento con el numero atómico
      ELEMENTO_NUMERO=$($PSQL " SELECT A.atomic_number, A.name, A.symbol, C.type, B.atomic_mass, B.melting_point_celsius, B.boiling_point_celsius FROM elements AS A INNER JOIN properties AS B ON A.atomic_number=B.atomic_number INNER JOIN types AS C ON B.type_id=C.type_id WHERE A.atomic_number=$1;")
      # if no existe esa madre
      if [[ -z $ELEMENTO_NUMERO ]]
      then
        echo I could not find that element in the database.
      else
        echo $ELEMENTO_NUMERO | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPEA BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
        do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPEA, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      fi
    else
      
      #checar si variable es symbol
      if [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
      then
        ELEMENTO_SIMBOLO=$($PSQL " SELECT A.atomic_number, A.name, A.symbol, C.type, B.atomic_mass, B.melting_point_celsius, B.boiling_point_celsius FROM elements AS A INNER JOIN properties AS B ON A.atomic_number=B.atomic_number INNER JOIN types AS C ON B.type_id=C.type_id WHERE A.symbol='$1';")
        # if no existe esa madre
        if [[ -z $ELEMENTO_SIMBOLO ]]
        then
          echo I could not find that element in the databasen.
        else
          echo $ELEMENTO_SIMBOLO | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPEA BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPEA, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
        fi
      else

        if [[ $1 =~ [A-Z][a-z] ]]
        then
          ELEMENTO_NOMBRE=$($PSQL " SELECT A.atomic_number, A.name, A.symbol, C.type, B.atomic_mass, B.melting_point_celsius, B.boiling_point_celsius FROM elements AS A INNER JOIN properties AS B ON A.atomic_number=B.atomic_number INNER JOIN types AS C ON B.type_id=C.type_id WHERE A.name='$1';")
        # if no existe esa madre
          if [[ -z $ELEMENTO_NOMBRE ]]
          then
            echo I could not find that element in the database.
          else
            echo $ELEMENTO_NOMBRE | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPEA BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
            do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPEA, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
            done
          fi
        else
        echo I could not find that element in the database.
        fi      
      fi
    fi
  else
    echo Please provide an element as an argument.
  fi