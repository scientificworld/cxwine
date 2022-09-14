cxpath="$HOME/Library/Application Support/CrossOver/Bottles"
cxapp="/Applications/CrossOver.app/Contents/SharedSupport/CrossOver/bin"
function _cxrun() {
	if [ ! -n "$2" ] || [ ! -d "$cxpath/$2" ]
	then
		echo "Bottle does not exist."
		return
	fi
	"$cxapp/cxbottle" --bottle "$2" "--$1"
}
function cxcreate() {
	if [ -e "$cxpath/$1" ]
	then
		echo "Bottle already exists."
		return
	fi
	if [ ! -n "$2" ]
	then
		set "$1" "win7"
	fi
	"$cxapp/cxbottle" --bottle "$1" --create --template "$2"
	date +%s > "$cxpath/$1/.create_timestamp"
	echo -n "$2" > "$cxpath/$1/.type"
}
alias cxdelete="_cxrun delete"
function cxwine() {
	if [ ! -h "$cxpath/default" ]
	then
		echo "Default bottle not set!"
		return
	fi
	if [ $[$(date +%s)-$(cat "$cxpath/default/.create_timestamp")] -gt $[10*24*3600] ]
	then
		echo "Bottle is outdated! Updating..."
		n="$(basename "$(readlink "$cxpath/default")")"
		t="$(cat "$cxpath/$n/.type")"
		f="$(mktemp -d)"
		cp -af "$cxpath/$n/drive_c/users/crossover/Application Data" "$cxpath/$n/drive_c/users/crossover/AppData" "$f"
		cxdelete "$n"
		cxcreate "$n" "$t"
		cxswitch "$n"
		cp -af "$f"/* "$cxpath/$n/drive_c/users/crossover"
		mv -f "$f" "$HOME/.Trash"
		unset n t f
	fi
	echo "Starting..."
	"$cxapp/wine" "$@"
}
