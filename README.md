# Issue List

## Get Started

### mongoid

You need `mongod` to run.

We also use mongoid to store the issues into mongoDB.
see http://mongoid.org/en/mongoid/index.html

### bower

```bash
bower install
```

### rails

```bash
bundle install --path vendor/bundle
bundle exec rake db:migrate
bundle exec rails s
```

Access to the URL `http://localhost:300/issue_list`, you'll be all set.
Try making single issue list for example.

have fun.
