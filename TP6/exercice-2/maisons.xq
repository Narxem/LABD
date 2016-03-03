xquery version "1.0";

declare option saxon:output "omit-xml-declaration='yes'";
declare variable $house = "maisons.xml";

<html>

<body>
  <table>
    <thead><tr><td>Maisons</td><td>Surfaces(m2)</td></tr></thead>
    <tbody>
      {
        for $m in doc($house)//maisons/maison
            $ch in $m/RDC::child[exists(@surface-m2)]
            $etag in $m/étage::child[exists(@surface-m2)]
        let $surf-ch = sum($ch/@surface-m2)
        let $surf-etag = sum($etag/@surface-m2)
        return
            <tr>
              <td>Maison {$m/@id}</td>
              <td>{sum($ch,$etag)}</td>
            </tr>

      }
    </tbody>
  </table>
</body>

</html>
