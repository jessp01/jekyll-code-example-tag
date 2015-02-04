require_relative './spec_helper.rb'

describe 'all_page_code_examples', fakefs: true do

  # TODO: Make this soo much better
  let(:page) do
    page = <<EOF
{% code_example hello_world %}
{% code_example goodbye_world %}
{% all_page_code_examples %}
EOF
  end

  let(:page_markup) do 
    page_markup = <<EOF
<div class='code-examples'>            <div class="buttons examples">
              <ul>
                <li><a href='#' class='button' target='python'>Python</a></li>
              </ul>
            </div>
          <div class="highlight example python">
            <pre><code class="language-python" data-lang="python">print "Hello World"print "Goodbye World"</code></pre>
          </div>
</div>
EOF
    page_markup.rstrip
  end

  before(:all) do
    FakeFS.activate!
    FileUtils.mkdir_p('code_examples/python')
    File.open('code_examples/python/hello_world', 'w') { |f| f << 'print "Hello World"'}  
    File.open('code_examples/python/goodbye_world', 'w') { |f| f << 'print "Goodbye World"'}
  end

  after(:all) do
    FakeFS.deactivate!
  end

  it 'can be used' do
    t = Liquid::Template.parse(page)
    o = t.render!({'site' => {}, 'page' => {'content' => page}})
    expect(o).to include(page_markup)
  end
end
