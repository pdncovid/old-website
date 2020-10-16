#!/bin/bash

arrPages=("about-us" "calendar" "links" "research" "publications" "news" "people" "join-us" "contact")
arrPeople=("anuruddhika" "beshan" "gihan" "harshana" "jameel" "jbe" "mevan" "parakrama" "roshan" "rumali" "samath" "suren" "umar" "vijitha" "mallika" "sakunthala")

generatePage(){
    echo $1
    rm -r ../$1
    mkdir ../$1
    cat ./part0.html > ../$1/index.html
    echo " : "$1 >> ../$1/index.html
    cat ./part1.html >> ../$1/index.html
    echo "<a href=\"../\">Home</a> : <a href=\"./\">"${1^^}"</a>" >> ../$1/index.html
    cat ./part2.html >> ../$1/index.html


    echo "<tr><td><a href=\"../\">HOME</a></td></tr>" >> ../$1/index.html
    for pp in ${arrPages[@]}; do
      if [ $pp = $1 ] 
      then
        echo "<tr><td bgcolor=\"#D2691E\"><a href=\"#\">"${pp^^}"</a></td></tr>" >> ../$1/index.html
      else
        echo "<tr><td><a href=\"../"$pp"\">"${pp^^}"</a></td></tr>" >> ../$1/index.html
      fi
    done

    
    cat ./part3.html >> ../$1/index.html
    cat ./$1.html >> ../$1/index.html
    cat ./part4.html >> ../$1/index.html
}

generateIndexPage(){
	echo "Index.html"
	rm ../index.html
	cat ./part0.html > ../index.html
	cat ./part1.html >> ../index.html
	echo "<a href=\"./\">Home</a>" >> ../index.html
	cat ./part2.html >> ../index.html

	echo "<tr><td bgcolor=\"#D2691E\"><a href=\"../\">HOME</a></td></tr>" >> ../index.html
	for pp in ${arrPages[@]}; do
	  echo "<tr><td><a href=\"./"$pp"\">"${pp^^}"</a></td></tr>" >> ../index.html
	done

	cat ./part3.html >> ../index.html
	cat ./index.html >> ../index.html
	cat ./part4.html >> ../index.html
}


echo "STARTING...."



generateIndexPage

for p in ${arrPages[@]}; do
  generatePage $p
done

for p in ${arrPeople[@]}; do
  generatePage $p
done

echo "END....."
