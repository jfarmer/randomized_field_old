# RandomizedField

[![Build Status](http://travis-ci.org/jfarmer/randomized_field.png)](http://travis-ci.org/jfarmer/randomized_field)

RandomizedField is a simple plugin for ActiveRecord that populates a field with a unique,
randomly-generated string.  This is useful for generating one-off tokens or creating a
non-incrementing unique ID.

Oftentimes we want a randomized unique ID so that we don't reveal information about how
large our database is, or to create an unguessable (and perhaps temporary) token for
things like password resets, etc.

You might use RandomizedField to generate:
* Order numbers, return authorization numbers, etc. for an e-commerce system
* Unique referral IDs or invitation tokens for each user of your site
* Tokens for password reset emails
* Temporary tokens embedded in an email that automatically log users in
* 

## Features

RandomizedField currently generates a random, fixed-length string with an optional prefix.
You can control the length of the string, what characters are used to generate the string, and what
prefix to prepend to the string (if any).

Like I said: simple.

## Rails Quickstart
```ruby
    gem install randomized_field

    rails new my_app

    cd my_app

    gem "randomized_field"

    rails generate scaffold user name:string random_id:string

    # edit db/migrate/*_create_users.rb
    add_index :users, :random_id, :unique => true

    rake db:migrate

    # edit app/models/user.rb
    class User < ActiveRecord::Base
	  randomized_field :random_id, :length => 6, :prefix => 'U'
    end

    User.create! name: "Joe Schmoe"

    rails server
	
	User.find_by_random_id(params[:random_id])
```
	
## Bugs

Please report them on the [Github issue
tracker](http://github.com/jfarmer/randomized_field_/issues) for this project.

If you have a bug to report, please include the following information:

* **Version information for RandomizedField, Rails and Ruby.**
* Full stack trace and error message (if you have them).
* Any snippets of relevant model, view or controller code that shows how you
  are using RandomizedField.


## License

Copyright (c) 2012 Jesse Farmer, released under the MIT license

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

