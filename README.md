## Blocipedia

# A Wikipedia replica built with Ruby on Rails

Welcome to Blocipedia!

![Wikipedia-logo](https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/500px-Wikipedia-logo-v2.svg.png)

[Check out the app!](https://mysterious-retreat-59118.herokuapp.com/)

I built Blocipedia using Devise for my user model, so it has plenty of user freedom including signup/signin, email confirmation, 'forgot password' assistance, and a 'timeoutable' sign-out for inactive sessions.

You can also update your profile at any time, including the ability to upgrade your account to premium (and downgrade :( too). I use Stripe for the upgrade fee, so payments are smooth and easy for the user.

The main function of the app is the ability to add and edit wikis. Any user can create public wikis, but only 'premium' users can make private wikis. If a user decides to downgrade to a 'standard' membership, their private wikis become public.

If a wiki is 'public', than any user can edit, while a 'private' wiki can only be edited by its collaborators (or admins), which the author of the wiki chooses.

I created the ability to add collaborators by creating a model and using a HMT (Has Many Through) relationship between wiki and user models. When choosing collaborators, the author can select the users from a dropdown menu, and also remove them at any time.

Here's how the Has Many Through relationship is coded:

{% highlight ruby %}
class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
{% endhighlight %}

{% highlight ruby %}
class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators
  has_many :shared_wikis, through: :collaborators, source: :wiki
{% endhighlight %}

{% highlight ruby %}
class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :wiki
{% endhighlight %}

In my example, the Collaborator model (which can also be considered a '*join table*', since it *joins* the User and Wiki tables) gives me the ability to call Wiki.users to see that wiki's collaborators, and User.shared_wikis to see all the wikis that that user collaborates on (I used source: :wiki to be able to change the name to :shared_wikis to prevent confusion, since User.wikis would return the wikis where that user is the author). The Has Many Through relationship is a great tool to have in your belt.

# About me

I'm a developer who's passionate about writing good code and loves the satisfaction of solving problems.

I've developed several apps using JavaScript, AngularJS, jQuery, and Ruby on Rails, using Git/Github as well as Heroku.

I'm also experienced HTML5 and CSS, and have worked with SQL and Firebase.

Currently, I'm looking for a developer role at a company that's as passionate as I am about doing good work.

[Check out more at my site!](http://stevevancott.com)

Feel free to email me at thevanicotti@gmail.com
