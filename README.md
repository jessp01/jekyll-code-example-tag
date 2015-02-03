jekyll-code-example-tag
=======================

Provides a tag that allows you to include in your posts and pages code examples
for multiple langagues that are kept in seperate files. Another tag allows you
to combine all code examples that are on a page.

## Installation

Add the following to your application's Gemfile:

    gem 'jekyll-code-example-tag'

and then execute:

    bundle install

Or install it manually:

    gem install jekyll-code-example-tag

## Usage

### code_example

First, select a folder to place your code examples in. By default, the top
level folder `code_examples` will be used. If you would like to store your
examples in a different folder, than create and set a `code_example_dir`
setting in your _config.yaml:

    code_example_dir: assets/code/examples

Now, add some code examples. Create folders for each language you would like to
provide a code example for. Then, add files to each language folder that 
contain language appropriate code examples.

For example, say we would like to include some Hello World examples in Ruby and
Python. First, assuming we are using the default code examples directory, we
would add the following to your project:

    .
    |-code_examples
      |-ruby
        |-hello_world
      |-python
        |-hello_world

`ruby/hello_world` could contain

    puts "Hello World"

while `python/hello_world` could contain

    print "Hello World"

Now, create a post that includes these code examples. Include a code example in
a page or posting with the *code_example* tag:

    ---
    title: Starting to Program
    ---

    Here is everybody's favorite first program, in Ruby and Python.

    {% code_example hello_world %}

Build your site, and you will find a page that contains the following markup:

    <p>Here is everybody's favorite first program, in Ruby and Python.</p>

    <div class="code-examples">            
      <div class="buttons examples">
        <ul>
          <li><a href="#" class="button active" target="Python">Python</a></li>
          <li><a href="#" class="button" target="ruby">Ruby</a></li>
        </ul>
      </div>
      <div class="highlight example python" style="display: block;">
        <pre><code class="language-python" data-lang="python">print "Hello World"</code></pre>
      </div>
      <div class="highlight example ruby" style="display: none;">
            <pre><code class="language-ruby" data-lang="ruby">puts "Hello World"</code></pre>
      </div>
    </div>

The *code_example* tag will search the folders in your code examples directory
for files that match whatever string is given to it, and will include only
languages/files that match it. Thus, if you add a `goodbye_world` example in
just Ruby:

    .
    |-code_examples
      |-ruby
        |-goodbye_world
        |-hello_world
      |-python
        |-hello_world

and include it in a post:

    {% code_example goodbye_world %}

the resulting markup will include just the Ruby example:

    <div class="code-examples">            
      <div class="buttons examples">
        <ul>
          <li><a href="#" class="button" target="ruby">Ruby</a></li>
        </ul>
      </div>
      <div class="highlight example ruby" style="display: none;">
            <pre><code class="language-ruby" data-lang="ruby">puts "Goodbye World"</code></pre>
      </div>
    </div>

### all_page_code_examples

If you have included a few code examples on a page via the *code_example* tag,
you can provide your readers with an easy to copy version of all of your
examples by using the *all_page_code_examples* tag:

    {% all_page_code_examples %}
