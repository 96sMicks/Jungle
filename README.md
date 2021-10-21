# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The Jungle app allows admins to create and list new products for sale  while vistors are able to pay via online credit card payments.

# ScreenShots
A User visits the Jungle Homepage
!["A User visits the Jungle Homepage"](https://github.com/96sMicks/Jungle/blob/master/docs/Jungle-Homepage.png)
A product on sale in Jungle 
!["A product on sale in Jungle"](https://github.com/96sMicks/Jungle/blob/master/docs/A%20Product%20on%20sale%20in%20Jungle.png)
A User selecting a product to buy
!["A User selecting a product to buy"](https://github.com/96sMicks/Jungle/blob/master/docs/A%20User%20selecting%20a%20product.png)
The Order details page before payment
!["The Order details page before payment"](https://github.com/96sMicks/Jungle/blob/master/docs/The%20Order%20detail%20page.png)
A User checking out their cart
!["A User checking out their cart"](https://github.com/96sMicks/Jungle/blob/master/docs/A%20User%20checking%20out.png)
A User's receipt after payment
!["A User's receipt after payment"](https://github.com/96sMicks/Jungle/blob/master/docs/A%20User%20receipit%20after%20payment.png)
## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
