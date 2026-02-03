# 🛠️ Boîte à outils Administration Système - Debian

Ce dépôt regroupe 12 scripts Bash réalisés pour automatiser des tâches courantes sous Debian.

## 📋 Liste des scripts disponibles

### 📁 Gestion de fichiers & Sauvegarde
* **cloneur.sh** : Copie le contenu d'un dossier vers une cible (la crée si besoin).
* **sauvegarde.sh** : Archive un dossier en `.tar.gz` avec la date du jour.
* **synchro.sh** : Synchronise deux dossiers de manière intelligente (rsync).

### 👤 Administration Utilisateurs
* **nouvel_user.sh** : Création d'un utilisateur avec mot de passe et dossier perso.
* **bonus_users.sh** : Création automatisée d'utilisateurs via un fichier CSV.

### 🖥️ Monitoring & Système
* **disque.sh** : Analyse l'espace disque avec alertes en rouge (si > 80%).
* **services.sh** : Gestionnaire d'état et redémarrage des services (SSH, Apache, etc.).
* **monitoring.sh** : Analyse des logs pour extraire les IPs les plus actives.
* **nettoyeur.sh** : Suppression automatique des vieux logs selon un nombre de jours.
* **rapport.sh** : Génération d'un rapport de santé système au format HTML.

### 🌐 Réseau & Logiciels
* **reseau.sh** : Test de connectivité vers plusieurs serveurs distants (ping).
* **installateur.sh** : Installation automatique de paquets via une liste .txt.

---
## 🚀 Utilisation
Lance le menu principal pour accéder à tous les outils :
`./menu.sh`
