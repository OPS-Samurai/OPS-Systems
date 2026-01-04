# @doc: Zeigt öffentliche IP
myip() { curl -s ifconfig.me; echo ""; }

# @doc: Universal-Entpacker
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *)           echo "❌ Unbekannt" ;;
        esac
    fi
}
