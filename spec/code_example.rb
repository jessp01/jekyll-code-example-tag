require_relative './spec_helper.rb'

describe 'code_example', fakefs: true do

  # TODO: Make this soo much better
  let(:page) { "{% code_example hello_world %}" }
  let(:page_markup) do 
    page_markup = <<EOF
<div class='code-examples'>            <div class="buttons examples">
              <ul>
                <li><a href='#' class='button' target='ruby'>Ruby</a></li><li><a href='#' class='button' target='python'>Python</a></li>
              </ul>
            </div>
          <div class="highlight example ruby">
            <pre><code class="language-ruby" data-lang="ruby">puts "Hello World"</code></pre>
          </div>
          <div class="highlight example python">
            <pre><code class="language-python" data-lang="python">print "Hello World"</code></pre>
          </div>
</div>
EOF
    page_markup.rstrip
  end

  before(:all) do
    FakeFS.activate!
    FileUtils.mkdir_p('code_examples/ruby')
    FileUtils.mkdir_p('code_examples/python')
    File.open('code_examples/ruby/hello_world', 'w') { |f| f << 'puts "Hello World"'}
    File.open('code_examples/python/hello_world', 'w') { |f| f << 'print "Hello World"'}  
  end

  after(:all) do
    FakeFS.deactivate!
  end

  it 'can be used' do
    t = Liquid::Template.parse(page)
    o = t.render!({'site' => {}})
    expect(o).to eq(page_markup)
  end
end
