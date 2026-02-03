#!/bin/bash
NOM_MACHINE=$(hostname)
DATE=$(date)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEM=$(free -m | awk '/Mem:/ { print $3 "Mo / " $2 "Mo" }')
DISQUE=$(df -h / | tail -1 | awk '{print $5}')

cat <<EOF > rapport.html
<html>
<head><title>Rapport $NOM_MACHINE</title>
<style>body{font-family:sans-serif; background:#f4f4f4;} .box{background:white; padding:20px; border-radius:10px; box-shadow: 2px 2px 10px #ccc;}</style>
</head>
<body>
<div class="box">
  <h1>État du système : $NOM_MACHINE</h1>
  <p>Généré le : $DATE</p>
  <ul>
    <li><b>CPU :</b> $CPU % d'utilisation</li>
    <li><b>Mémoire :</b> $MEM</li>
    <li><b>Disque :</b> $DISQUE utilisé</li>
  </ul>
</div>
</body>
</html>
EOF

echo "Rapport HTML généré : rapport.html"
# Optionnel : firefox rapport.html &
