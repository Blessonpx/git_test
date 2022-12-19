  # checking the presence of the module folder and updating tag variable accordingly
    lastTag=`git tag --sort=-creatordate | head -n 1`


    git pull --quiet  repo_build.bundle
    
    echo "...getting new tags for module $m"
    git fetch --tags --quiet  repo_build.bundle
    
    diffFiles=( $(git diff --name-only $lastTag) )

  diffSqlFiles=()

  for f in ${diffFiles[@]}; do
    if [[ "$f" == *".sql" ]]; then
     diffSqlFiles+=( $f )
    fi
  done

  # running the sql files 
  if [ ${#diffSqlFiles[@]} -gt 0 ]; then
    echo "...found updated sql files ${diffSqlFiles[*]}"
  fi


