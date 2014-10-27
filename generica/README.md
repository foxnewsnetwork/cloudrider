#TODO
1. admin.products.new
2. admin.translations.new
3. admin.taxons.new
4. admin.product.edit
5. admin.translation.edit
6. admin.taxon.edit
7. admin.product.delete
8. admin.translation.delete
9. admin.taxon.delete
10. admin.contacts.new
11. admin.contacts.index
12. admin.contact.edit
13. admin.contact.delete


#TODO before 12pm
1. Finish translations index
2. taxon index

# TODO before 8am
1. taxon tree view
2. product-catalog

Generic Company Profile
=======================

Commands required to build a generic company profile page

Generate the project
```shell
rails new <%= company_name %> -d mysql
```

Generate a Gemfile
Either the bootstrap gemfile or the foundation gemfile
```shell
cp shared/Gemfile.foundation <%= company_name %>/Gemfile
```

Bundle install then bootstrap ember
``` shell
bundle
```

By convention, we use coffeescript. In addition, client side code base all live in an Apiv1 object
```shell
rails generate ember:bootstrap -je coffee -n apiv1
```

The default generated application.js file is unsatisfactory for an emberjs app, we replace it with ours
```shell
cp shared/app/assets/javascripts/application.foundation.js <%= company_name %>/app/assets/javascripts/application.js
cp shared/app/assets/javascripts/apiv1.js.ls <%= company_name %>/app/assets/javascripts/apiv1.js.ls
```

By default, the ember bootstrap doesn't create all the folders we will be using, we create them ourselves
```shell
mkdir <%= company_name %>/app/assets/javascripts/adapters
mkdir <%= company_name %>/app/assets/javascripts/config
```

By default, rails' router is insufficient and should be replaced
```shell
cp shared/config/routes.rb <%= company_name %>/config/routes.rb
```

Similarily, we migrate in our own controllers
``` shell
cp -r shared/app/controllers/apiv1 <%= company_name %>/app/controllers/
```

We migrate in the views
```shell
cp -r shared/app/views/apiv1 <%= company_name %>/app/views/
```

We must also migrate in the models
```shell
cp -r shared/app/modesl/apiv1 <%= company_name %>/app/models/
```

Migrate in model migrations
```shell
cp -r shared/db/migrate <%= company_name %>/db/
```

Ask rake to do the database migration and annotate everything
```shell
rake db:create
rake db:migrate
annotate
```

Migrate in seeds and then seed them
```shell
cp shared/db/seeds.rb <%= company_name %>/db/seeds.rb
rake db:seed
```

Application template possibilities
```emblem
  splash-background types are static, carousel, sliced, diced, slice-and-diced, gradient, fill
  splash-logo-tagline types are box-left, box-right, box-center, overflowed-down
  splash-call-to-action types are box-left, box-right, box-center, overflowed-down

introductory-lobby
  about-background
  about-doodad
  about-company

products-showroom types singles, pairs, triplets
  each product in products
    product-showcase product=product
  rest-of-the-products

table-booths
  each contact in contacts
    person-booth person=person
  rest-of-the-cast

```

Website making json
```json
website =
  what_is_your_company_name: names
  what_does_your_company_do: actions
  where_is_your_company: locations
  pictures_of_your_company: pictures
  your_feelings_about_your_website: pentagram

names = 
  official_name: string
  nicknames: [string]

actions = [action]
action =
  verb: string
  object: string

locations = [location]

pictures = [picture]
picture = 
  file: file
  tags: [tag]

pentagram = {
  vividness: 1..100 # aka color and pictures
  effects: 1..100 # javascript effects and fancy animation
  spacing: 1..100 # affects padding and margins and empty space
  attitude: 1..100 # affects oddity of fonts, amount of non-linear aligned texts, and striking contrast
  visuality: 1..100 # affects number (and size, dominance, etc.) of pictures
}
```