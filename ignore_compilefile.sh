#! /bin/sh
# 将编译生成的文件的可执行文件忽略掉，问题的关键在于，判断文件是否是可执行的
# 使用 [[ -x $file ]] 判断
#
# @note 由于在 zsh 的环境下， 只能使用 [[ ]] 条件语句，而不能使用 [ ] 条件语句

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
