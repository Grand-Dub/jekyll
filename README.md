Installation
============

- faire un *Dockerfile* qui permet d'avoir l'environnement de https://jekyllrb.com/docs/installation/
- le *docker-compose.yaml* est un exemple utile pour les *volumes*
- **Construction:** `docker build -t jekyll:ruby-3.2.2-bookworm .`
- créer le répertoire *site* afin d'avoir les droits dessus (en supposant que l'utilisateur créé dans le *Dockerfile* a les mêmes *id* que celui qui va travailler ici, sinon on peut modifier le *Dockerfile* en conséquence -> `useradd --uid ... --gid ... ...`)

Initialisation
==============

*Avec le répertoire `site` vide:*
```sh
docker compose up -d
docker compose exec -it jekyll bash
```
*Dans le container:* (source: https://jekyllrb.com/docs/)
```sh
jekyll new site
cd site
bundle install
bundle exec jekyll serve -H 0.0.0.0 -w
```
Ajout de **GitHub Pages**
-------------------------
*Modifier `Gemfile`:*
```ruby
# commenter la ligne de "jekyll"
#gem "jekyll", "~> 4.3.2"
...
gem "github-pages", group: :jekyll_plugins
gem "webrick"
```

**Modifier le fichier `_config.yml` pour personnaliser...**

Utilisation
===========

*Dans le container:*
```sh
cd site
bundle install # si modification du Gemfile
# faire le fichier config.localhost.yaml qui est diffère un peu de celui de github-pages
bundle exec jekyll serve -H 0.0.0.0 --config _config.localhost.yaml --incremental --strict_front_matter --drafts
```
