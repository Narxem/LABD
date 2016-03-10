xquery version "1.0";

declare option saxon:output "omit-xml-declaration=yes";
declare variable $house := "maisons.xml";

<html>

<body>
  <table>
    <thead><tr><td>Maisons</td><td>Surfaces(m2)</td></tr></thead>
    <tbody>
      {
        for $m in doc($house)//maisons/maison
        let $surf-maison := 
          for $surf in $m/*/child::node()[exists(@surface-m2)]
          return 
            $surf/@surface-m2
        let $id := $m/@id
        return
            <tr>
              <td>Maison {fn:data($id)}</td>
              <td>{sum($surf-maison)}</td>
            </tr>

      }
    </tbody>
  </table>
</body>

</html>
