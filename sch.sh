#!/bin/bash

# Funktion zur Verwendung des Skripts
usage() {
    echo "Verwendung: ./script.sh [install NAME]"
    echo "  - Standardmodus: zeigt 'Hallo' an"
    echo "  - Installationsmodus: lädt und führt ein Skript aus einem Ordner im Repository SchBenedikt/easy-docker aus"
    exit 1
}

# Farben für die Ausgabe
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Keine Farbe

# Standardmodus: zeigt 'Hallo' an
if [ $# -eq 0 ]; then
    echo "Hallo"
    exit 0
fi

# Installationsmodus: überprüft, ob das Skript mit 'install' und einem Namen aufgerufen wurde
if [ "$1" = "install" ] && [ -n "$2" ]; then
    NAME=$2
    REPO_URL="https://api.github.com/repos/SchBenedikt/easy-docker/contents/$NAME"

    # Temporäres Verzeichnis zum Speichern der heruntergeladenen Dateien
    TEMP_DIR=$(mktemp -d)

    echo "Lade Verzeichnis herunter von: $REPO_URL"
    
    # Hole den Inhalt des Verzeichnisses als JSON
    RESPONSE=$(curl -s "$REPO_URL")

    # Überprüfen, ob das Verzeichnis existiert
    if echo "$RESPONSE" | grep -q '"message": "Not Found"'; then
        echo -e "${RED}Konnte nicht heruntergeladen werden.${NC}"
        usage
    fi

    # Extrahiere die Download-URLs aus der JSON-Antwort
    FILES=$(echo "$RESPONSE" | jq -r '.[] | select(.type == "file") | .download_url')

    for file_url in $FILES; do
        # Extrahiere den Dateinamen
        file_name=$(basename "$file_url")
        
        # Lade die Datei herunter
        echo "Lade Datei herunter: $file_url"
        curl -s -o "$TEMP_DIR/$file_name" "$file_url"
    done

    # Überprüfen, ob das Skript erfolgreich heruntergeladen wurde
    SCRIPT_PATH="$TEMP_DIR/$NAME.sh"
    if [ -f "$SCRIPT_PATH" ]; then
        echo -e "${GREEN}Skript erfolgreich heruntergeladen.${NC}"
        echo "Führe das Skript aus: $NAME.sh"
        
        # Skript ausführbar machen
        chmod +x "$SCRIPT_PATH"
        
        # Skript ausführen
        bash "$SCRIPT_PATH"
    else
        echo -e "${RED}Skript nicht gefunden oder konnte nicht heruntergeladen werden.${NC}"
        usage
    fi

    # Aufräumen
    rm -rf "$TEMP_DIR"
else
    # Falsche Benutzung des Skripts
    usage
fi
