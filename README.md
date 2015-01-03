# APU

Apu is a small application I made to help my relatives plan budgets for their clients.

The key features are:

* Create budgets. Each budgets must have products, with descriptions, price and quantity.
* Reorder the products in a budget.
* Download the budget to print or send my email.

Since this is not for selling, I implemented only the required features.

## Quick start

### Install dependencies

wkhtmltopdf is the only dependency besides the meteor stack. To learn how to install please visit [here](http://wkhtmltopdf.org/).


### Envoirment Variables

You need to create a file in `.dev/settings.json` with the following structure

```json
{
  "allowed_emails": [
    "email1@gmail.com",
    "email2@gmail.com"
  ]
}
```

In this file you need to define the emails that are allowed to log in to your application.

A similar file needs to be created in `.deploy/settings.json` for production settings.

### Start up

You're now ready, run `bin/server` and a meteor server should be available to you in [http://localhost:3000](http://localhost:3000).

## Deploy

There is a meteor up configuration file.

The first time you're deploying you need to setup the server.
Go to the `.deploy` folder

```
cd .deploy
```

And run

```
mup setup
```

The setup is done. Now every time you need to deploy just run

```
bin/deploy
```
