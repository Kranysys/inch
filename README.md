# Projet INCH

### Quickstart

Installer les dépendances : `bundle install`

Migration de la base de donnée : `rails db:migrate`

Lancer le backend : `rails server`

### Tests

Utilisation de RSpec pour les tests unitaires

Lancer les tests : `bundle exec rspec`

### Routes API

- GET http://localhost:3000/up : Vérification que le backend fonctionne
- POST http://localhost:3000/import/new : Importation d'un fichier CSV (Building ou Persons)
- GET http://localhost:3000/import/new : Interface d'envoi de fichier CSV (Building ou Persons)

### Fichiers d'exemples

- Persons.csv : fichier d'exemple de 5 personnes
- Buildings.csv : fichier d'exemple de bâtiments

### Auteurs

Nicolas BAPTISTA
