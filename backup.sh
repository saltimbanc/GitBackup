 #!/bin/bash 
 # Created by Turbatu Dumitru Titus
 # src = source folder (the git repository folder).
 # dst = destination folder.
 # Don't add "/" at the end of the paths.
 src="[git repository location]" # Change this
 dst="[backup location]" # Change this
 eval "cd $src"
 $(mkdir -p $dst)
 IFS=$'\n'; files=($(git status -s | sed 's/^[A-Z]* *//g'));
 for (( i=0; i<${#files[@]}; i++ )); do
 	file=(${files[i]});
 	if [[ $file == */* ]] # The relative file path contains folders
 		then # This needs optimization because "mkdir" is run even if the folder exists
 		IFS='/'; arrIN=($file); unset IFS;
 		dir=""
 		for (( j=0; j<${#arrIN[@]}; j++ )); do
 			dir="${dir}/${arrIN[j]}";
 			if [[ ! $dir =~ .*\.{1,5} ]]
 				then
 				eval "mkdir -p ${dst}${dir}"
 			fi
 		done
 	fi
 	eval "cp ${src}/${file} ${dst}/${file}"
 done
 unset IFS;
