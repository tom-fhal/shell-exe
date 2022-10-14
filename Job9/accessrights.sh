i=2
j=$(wc -l <Shell_Userlist.csv)  
((j+=2))
#echo $j
while [ $i != $j ]      #boucle sur l'ensemble du Shell_Userlist.csv
do
    #sed -n $i'p' Shell_Userlist.csv
    sed -n $i'p' Shell_Userlist.csv > murlolock.txt        
    if grep -q 'Admin' murlolock.txt  
        nom=$(cut -d ',' -f 2 murlolock.txt)    
        mdp=$(cut -d ',' -f 4 murlolock.txt)   
        id=$(cut -d ',' -f 1 murlolock.txt)     
        #création du profil utilisateur admin
        dscl . -create /Users/$nom
        dscl . -create /Users/$nom UniqueID $id
        dscl . -passwd /Users/$nom $mdp
        dscl . -append /Groups/admin GroupMembership $nom
        #echo "ADMIN \n"
        #echo $nom
    else
        nom=$(cut -d ',' -f 2 murlolock.txt)     
        mdp=$(cut -d ',' -f 4 murlolock.txt)     
        id=$(cut -d ',' -f 1 murlolock.txt)                                                
        dscl . -create /Users/$nom
        dscl . -create /Users/$nom UniqueID $id
        dscl . -passwd /Users/$nom $mdp
        #echo $nom
    fi
    ((i+=1)) 
done
rm murlolock  


