== txt2Json ==

Einfaches Tool zum konvertieren von Text-Dateien nach JSON.


Aus einer Text-Datei, die pro Zeile einen Wert enthält wird die folgende JSON Datei erzeugt:


    Tom
    Cruise
    Alex
    Schmid


JSON Datei:


    [
        {
            "name" : "Tom",
            "vorname" : "Cruise"
        },
        {
            "name" : "Alex",
            "vorname" : "Schmid"
        }
    ]

Dazu wird das Tool wie folgt aufgerufen:

    txt2Json <Dateiname> <Komma-getrennte-Liste-mit-Property-Bezeichnungen>

Beispiel:

    txt2Json daten.txt name,vorname

