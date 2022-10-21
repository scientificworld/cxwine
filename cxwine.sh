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
}
alias cxdelete="_cxrun delete"
alias cxswitch="_cxrun default"
function cxwine() {
	if [ ! -h "$cxpath/default" ]
	then
		echo "Default bottle not set!"
		return
	fi
	rm "$cxpath/default/.eval"
	echo "Starting..."
	"$cxapp/wine" "$@"
}
alias cxfuck="killall -9 wine32on64-preloader wine64-preloader"
