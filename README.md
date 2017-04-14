## Blocipedia

# A Wikipedia replica built with Ruby on Rails

Welcome to Blocipedia! Here you'll find the content from the app.

[Check out the app!](https://mysterious-retreat-59118.herokuapp.com/)

![Wikipedia-logo](https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/500px-Wikipedia-logo-v2.svg.png)

I built Blocipedia using Devise for my user model, so it has plenty of user freedom including signup/signin, email confirmation, 'forgot password' assistance, and a 'timeoutable' sign-out for inactive sessions.

You can also update your profile at any time, including the ability to upgrade your account to premium (and downgrade :( too). I use Stripe for the upgrade fee, so payments are smooth and easy for the user.

The main function of the app is the ability to add and edit wikis. Any user can create public wikis, but only 'premium' users can make private wikis. If a user decides to downgrade to a 'standard' membership, their private wikis become public.

If a wiki is 'public', than any user can edit, while a 'private' wiki can only be edited by its collaborators (or admins), which the author of the wiki chooses.

I created the ability to add collaborators by creating a model and using a HMT (Has Many Through) relationship between wiki and user models. When choosing collaborators, the author can select the users from a dropdown menu, and also remove them at any time.

| class User |
| --- |
| has_many :wikis |
| has_many :collaborators |
| has_many :shared_wikis, through: :collaborators, source: :wiki |

|class Wiki|
| ---------------------------------------------------------------- |
| belongs_to :user |
| has_many :collaborators |
| has_many :users, through: :collaborators |

|class Collaborator|
| ---------------------------------------------------------------- |
| belongs_to :user |
| belongs_to :wiki |


 [Check out more at my site!](stevevancott.com).
