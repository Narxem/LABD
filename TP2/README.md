Adrien Agez <br/>
Nabil Maiz

# TP2 LABD

### Exercice 1

1) `//livre[titre="edition"]` affiche les livres dont le titre est "édition", alors que `//livre[titre=edition]` cherche les livres dont la valeur de l'élément titre est identique à celle de l'élément édition

exemple : 
    <livre>
        <titre>edition</titre>
        <edition>edition</edition>
    </livre>
    
    
2)
`/item/livre[@titre="labd" and position()=last()]` renvoie le dernier livre si son titre est "labd"
`/item/livre[@titre="labd"] [position()=last()]` renvoie le dernier livre dont le titre est "labd"
`/item/livre[position()=last()] [@titre="labd"]` renvoie la même chose que pour 1

exemple :
    <item>
        <livre>
            <titre>labd</titre>
        </livre>
        <livre>
            <titre>un autre titre</titre>
        </livre>
    </item>

3)

`/descendant::livre[1]` va chercher le premier livre du document
`//child::livre[1]` va chercher le premier livre fils de chaque noeud du document

exemple :
    <item>
        <livre/>
    </item>
    <item>
        <livre/>
    </item>


### Exercice 2

1. `/descendant::fruit/producteur`
2. `/descendant::legume[origine='Espagne']`
3. `/descendant::fruit[bio and @type="clementine" and @calibre="1"]`
4. `/descendant::*/origine[@region="Bretagne"]/../producteur`


### Exercice 3


           recette1                                                             |   recette2
    1   //recette/titre                                                         |   //recette/titre
    2   //ingredient/nom_ing                                                    |   //ingredient[@nom]
    3   //recette[2]/titre                                                      |   //recette[2]/titre
    4   //recette/texte/etape[last()]                                           |   //recette/texte/etape[last()]
    5   count(//recette)                                                        |   count(//recette)
    6   //recette/ingredients[count(ingredient) < 7]/..                         |   //recette/ingredients[count(ing-recette) < 7]/..
    7   //recette/ingredients[count(ingredient) < 7]/../titre                   |   //recette/ingredients[count(ing-recette) < 7]/../titre
    8   //recette/descendant::ingredient[contains(nom_ing, "farine")]/../..     |   //ing-recette[@ingredient="farine"]/../..
    9	//categorie[contains(text(), "entrée") or contains(text(),"Entrée")]/.. |   //recette[contains(@categ, "entree")]
	
	
### Exercice 1
    
    1   count(//key[contains(text(), "Tracks")]/following-sibling::dict/child::*)
	2   //key[contains(text(), "Album")]/following-sibling::string[position()=1]
	3   //key[contains(text(), "Genre")]/following-sibling::string[position()=1]
	4   count(//key[contains(text(), "Genre")]/following-sibling::string[position()=1 and text()="Jazz"])
    
    
    