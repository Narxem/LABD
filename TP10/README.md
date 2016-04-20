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


5.1)
```SPARQL
SELECT ?y WHERE
{
 ?x ?y ?t
FILTER (?t = "John")
}
```

5.2)
```SPARQL
DESCRIBE ?x ?y ?t WHERE
{
 ?x ?y ?t
FILTER (?t = "John")
}
```
6.1)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x ?s ?t WHERE
{
 ?x humans:hasChild ?t
OPTIONAL {
?x humans:hasChild ?t
?x humans:hasSpouse ?s}
}
```

6.2) idem (car on a toutes les personnes qui ont un enfant au moins (en comptant maris et femmes).

6.3) On obtient 5 réponses dont 1 doublon (gaston)

6.4) Si on prend les couples (parent,enfant) alors il n'y a pas de doublons.

6.5) 
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x ?s ?t WHERE
{
 ?x ?y humans:Man
 FILTER NOT EXISTS {?x humans:hasChild ?o}
}
```

6.6)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x ?s ?t WHERE
{
 ?x ?y humans:Woman
 ?x humans:hasSpouse ?j
 OPTIONAL {?x humans:hasChild ?o}
}
```
	
7) Il n'y en a pas.
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT DISTINCT ?x ?t WHERE
{
 ?x humans:hasSpouse ?t
 ?x humans:shirtsize ?p
 ?t humans:shirtsize ?q
FILTER (?p = ?q)
}
```

8)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

CONSTRUCT {
	?x humans:hasFriend ?y
}
WHERE{
	?y humans:hasFriend ?x
}
```		

9) On retrouve des hommes car il sont déclarés comme étant des personnes et comme il n'y a pas d'inférence de type automatique, le système n'en déduit pas que ce sont des hommes si ce n'est pas explicitement déclaré.

## Exercice 2 : Interrogation du schéma RDFS seul

1) La propriété age peut porter sur toutes les classes de l'espace de nom humans.

2)
```SPARQL
SELECT ?x WHERE
{
 ?x ?t rdfs:Class
}
```

3) 
```SPARQL
SELECT DISTINCT ?t WHERE
{
 ?x rdfs:subClassOf ?t 
}
```
4)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x ?y ?t  WHERE
{
 humans:shoesize ?x ?t
FILTER (?x = rdfs:comment)
}
```
5)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?t (lang(?t) as ?p)  WHERE
{
 humans:Person ?y ?t
 FILTER (?y = rdfs:label && ?p = "fr")
}
```

6) 


## Exercice 3 : Utilisation conjointe du schéma et de l'instance

1.1)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x  WHERE
{
 ?x ?y humans:Animal
}
```

0 réponse

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x  WHERE
{
 ?x ?y humans:Person
}
```

7 réponses

1.2) Cette fois-ci on obtient plus de résultat car il y a une inférence de type (avec le fichier rdfs, par exemple le fait que "Male" soit un "Animal"...).

2)


3) On obtient 7 résultats. (car inférence de type)
```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x ?t WHERE
{
 ?x ?y humans:Lecturer
 ?x rdf:type ?t
}
```


Q4) C'est à cause de l'inférence de type (par exemple John possède la propriété hasParent qui est une sous propriété de hasAncestor et c'est de la même manière que les autres résutats sont inférés).

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>

SELECT ?x WHERE
{
 ?x humans:hasAncestor ?y 
}
```
