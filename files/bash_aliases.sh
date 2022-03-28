
alias ll='ls -lhartG'

alias tolower="tr '[:upper:]' '[:lower:]'"

alias stripemails='pbpaste | strip_emails_stdin.py | pbcopy | sort | uniq && pbpaste && echo  ^results above are on your clipboard'