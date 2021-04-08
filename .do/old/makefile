default :
	make --no-print-directory all

all :
	make mac
	# make raid

mac :
	ansible-playbook macOS.yml

# --- Initialize
raid :
	ansible-playbook my.yml -t raid

# --- Wipe
wipe :
	ansible-playbook my.yml -t "wipe"

wipe-all:
	ansible-playbook my.yml -t "wipe,wipe-everything"

dbg:
	ansible-playbook my.yml -t "wipe,raid" -vvvv

l:
	clear
	sudo vgs
	echo -e "\n\n"
	sudo lvs

help h:
	cat makefile
