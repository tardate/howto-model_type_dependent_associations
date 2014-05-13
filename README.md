# Modeling a tree with type-dependent descendent associations with STI

This is a simple example inspired by a discussion on the
[Singapore Ruby Brigade list](htps://groups.google.com/forum/#!topic/singapore-rb/Xj5LDqPfBKU)

### The Quick Question

    I have a Person class with father and mother references to itself
    How can I define the has_many children to be inverse of either of them depending on the gender?

e.g. fathers have many children based on a 'father' relationship,
whereas mothers have many children based on a 'mother' relationship.

### and the even quicker answer
From choonkeat: Gender issues aside, these docs should help:

* how to do [single table
inheritance](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance)
* and how to use [has_many...
:class_name](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#module-ActiveRecord::Associations::ClassMethods-label-Customizing+the+query)

## Code
There are a few ways to model this.
The STI approach is probably the cleanest and most straight-forward application of ActiveRecord conventions.
It is demonstrated with a few tests in this project.
See `test/support/migrations.rb` for the db setup.
See `test/family_tree_spec.rb` for the model definitions and the assertions of how it works.

## Run the examples
From the command line, just run `rake`, or just click the "Run" button on the runnable.com project page.

Run this for real at http://runnable.com/U2pu1OrFtww77sJT/type-dependent-descendent-associations-with-sti-for-ruby-activerecord-and-rails
