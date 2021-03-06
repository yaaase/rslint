<h1>stylr</h1>
<h4>a Ruby styleguide enforcer</h4>
[![Build Status](https://travis-ci.org/yaaase/stylr.png?branch=master)](https://travis-ci.org/yaaase/stylr)
[![Dependency Status](https://gemnasium.com/yaaase/stylr.png)](https://gemnasium.com/yaaase/stylr)
<img src="https://badge.fury.io/rb/stylr.png"/>

This gem will check if source code conforms to some elements of the Github Ruby Style Guidelines (https://github.com/styleguide/ruby) - currently supporting Ruby 2.1.0, but should support 1.9.3 and up (stylr uses the Ripper found in 1.9.3+; in 1.8.7, Ripper has been backported [here](https://github.com/lsegal/ripper18)).  Obviously it does not check against the subjective elements of the styleguide.

Kind of raw still.  Currently supports checking against the following:

* Line length (user-configurable)
* Missing parens around method definitions with parameters (ie, "def foo bar" is disallowed)
* Trailing whitespace of any kind
* Use of the <code>and</code> or <code>or</code> operators (&& and || are preferred)
* Use of <code>then</code> on a multiline <code>if</code>/<code>then</code> construct
* Spacing around parens
* Spacing around brackets
* Spacing around curly braces
* Using the keyword <code>for</code>
* Spacing around commas
* Using tab characters instead of soft tabs
* Spacing around math operators (<code>+</code>, <code>*</code>, etc)
* Use of <code>===</code> (instead of <code>is_a?</code> or <code>kind_of?</code>)
* Spacing after the negation (<code>!</code>) operator
* Nesting of (one-line) ternary expressions

Optionally checks for some metaprogramming, which you might not want in a large, enterprise codebase with varied levels of skill on your development team.  This is not a condemnation of these practices - most of them are good, idiomatic Ruby.  You might not, however, want your junior developers checking in lots of metaprogrammed code.  Pass the '--meta' flag to enable these checks.

* <code>eval</code>
* <code>class_eval</code>
* <code>instance_eval</code>
* <code>module_eval</code>
* <code>define_method</code>
* <code>send</code>
* <code>def method_missing</code>
* <code>def respond_to_missing?</code>

All of these things are configurable via yml.  See "stylr.yml" in the repo.  Whatever directory you run stylr from will look for stylr.yml.

Checks all *.rb files in the specified directory and subdirectories, excluding _spec.rb and _test.rb

<h4>Usage</h4>

<code>gem install stylr</code>

<code>stylr /path/to/directory</code> normal checks

<code>stylr /path/to/directory --meta</code> also check for use of metaprogramming

<code>stylr /path/to/directory --ignore=dir_to_ignore</code> optionally ignore a particular directory relative to the current directory

Here's what Rake uses to check against the stylr source itself with (launched from the stylr root dir):

<code>stylr . --ignore=spec --ignore=vendor</code>

<h4>Contributing</h4>

Please feel free to contribute!  There are issues and unimplemented features.  I'd love any help I can get.  Thanks!
