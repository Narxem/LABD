Adrien Agez <br/>
Nabil Maiz

# TP10 LABD : Initiation à SPARQL

## Exercice 1 : Interrogation de l'instance rdf seule

1)
Sélectionne tous les x qui ont un type
33 résultats
John est de type Personne

2) 
Cette requete demande toutes les personnes  qui sont mariées
6 réponses

3)
```SPARQL
PREFIX humans <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x WHERE
{
    ?x humans:age ?y
    FILTER (xsd:integer(?y) > 20)
}
```

4.1)
```SPARQL
PREFIX humans <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y WHERE
{
    ?x humans:shoesize ?y
}
```

4.2)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?person ?size WHERE
{
    ?person a humans:Person
    OPTIONAL {?person humans:shoesize ?size}
}
```

4.3) 
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?person ?size WHERE
{
    ?person a humans:Person
    OPTIONAL {?person humans:shoesize ?size
        FILTER (xsd:integer(?size) > 8)
    }
}
```

4.4)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?person ?shirtsize ?shoesize WHERE
{
    ?person a humans:Person
    {
        ?person humans:shoesize ?shoesize
        FILTER (xsd:integer(?shoesize) > 8)
    } UNION
    {
        ?person humans:shirtsize ?shirtsize
        FILTER (xsd:integer(?shirtsize) > 12)
    }
}
```
