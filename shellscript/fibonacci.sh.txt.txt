ib=0
ia=1
ai=1
echo "1"

for(( i=0; i<=5; i++)); do
	ia=$((ia+ib))
	ib=$((ia-ib))    #updates the new value for next iteration
	echo "$ia"
done
#======= fibonacci.sh =====
