#! /bin/sh

for dir in $(ls); do
  if [[ -d $dir  ]]; then
     echo 'generate .gitignore file for '$dir
     echo '# ignore file in '$dir >> .gitignore
     
     for file in $(ls $dir); do 
       tmp_file=${dir}'/'${file}

       if [[ -x $tmp_file  ]]; then 
         echo $tmp_file 
         echo $tmp_file >> .gitignore
       fi
     done
   fi
 done
