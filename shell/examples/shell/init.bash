# Environment Variables & Functions
for file in $HOME/.shell/{env,functions}/*.sh; do
    source "$file"
done

true
