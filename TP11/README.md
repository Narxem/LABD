Adrien Agez <br/>
Nabil Maiz

# TP11 LABD : SPARQL n°2

## Exercice 1 : Sports collectifs, le retour

1)
```SPARQL
SELECT ?x ?t WHERE
{
 ?x ?t rdfs:Class 
}
```

2)
`̀``SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x WHERE
{
 ?x rdfs:domain ?t
 FILTER (?t = schem:Sport)
}
```


3)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?y WHERE
{
  ?x a schem:Sport
  ?x ?y ?t
}
```

4)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?t WHERE
{
  ?x rdfs:comment ?t
 FILTER (contains(?t,"Sport") ||  contains(?t,"sport"))
}
```

5)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?t WHERE
{
  ?x a schem:Sport
 FILTER NOT EXISTS {?x schem:utiliseMateriel ?o}
}
```

6)
`̀̀ ̀ SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?y WHERE
{
  ?x schem:pratique ?t
}
GROUP BY ?x
```

```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?y WHERE
{
  ?x schem:pratique ?t
}
```

8)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
SELECT ?x ?y (COUNT(?x) as ?nx) WHERE
{
  ?x schem:pratique ?t
}
GROUP BY ?x
```

9)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
PREFIX inst: <http://www.labd.org/2015/sport/instance#>

SELECT ?x ?t  WHERE
{

 inst:Basket  schem:match/schem:duree/rdfs:member ?t

}
```

10) 
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
PREFIX inst: <http://www.labd.org/2015/sport/instance#>

SELECT ?x ?t  WHERE
{

 inst:Basket  schem:match/schem:duree/rdfs:member ?t
 FILTER (contains(?t,"NBA"))
}
```

11)
```SPARQL
PREFIX schem: <http://www.labd.org/2015/sport/schema#>
PREFIX inst: <http://www.labd.org/2015/sport/instance#>

SELECT ?x ?t  WHERE
{

 ?x a schem:SportCollectif 
 ?x schem:match/schem:duree/rdfs:member? ?t
 FILTER isLiteral(?t)
}
```



