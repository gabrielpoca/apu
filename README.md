This is a small application I made to help my relatives plan budgets for their clients.

The key features are:

* Create budgets. Each budgets must have products, with descriptions, price and quantity.
* Reorder the products in a budget.
* Download the budget to print or send my email.

Giving this is not for selling, I implemented only the required features.

## Quick start

wkhtmltopdf is the only dependency besides the meteor stack. To learn how to install please visit [here](http://wkhtmltopdf.org/).

Now run `meteor` and everything should be up and running.

## Deploy

There is a default meteor up configuration. To deploy first navigate to the `.deploy` folder

```
cd .deploy
```

Now, for the first time, run the setup

```
mup setup
```

Finally, run the deploy command

```
mup deploy
```

The setup step is not necessary in future deploys.
