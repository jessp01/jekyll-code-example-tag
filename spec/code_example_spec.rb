require_relative './spec_helper.rb'

describe 'code_example', fakefs: true do

  let(:page) { "{% code_example hello_world %}" }

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
    o_obj = Nokogiri::XML.parse(o)
    expect(o_obj.xpath('/div[@class="code-examples"]/div[@class="buttons examples"]/ul/li/a[@class="button"][@target="ruby"][.="Ruby"]')).not_to be_empty
    expect(o_obj.xpath('/div[@class="code-examples"]/div[@class="buttons examples"]/ul/li/a[@class="button"][@target="python"][.="Python"]')).not_to be_empty
    ruby_example = o_obj.xpath('/div[@class="code-examples"]/div[@class="highlight example ruby"]/pre/code[@class="language ruby"][@data-lang="ruby"]')
    expect(ruby_example).not_to be_empty
    expect(ruby_example.first.content).to eq 'puts "Hello World"'
    python_example = o_obj.xpath('/div[@class="code-examples"]/div[@class="highlight example python"]/pre/code[@class="language python"][@data-lang="python"]')
    expect(python_example).not_to be_empty
    expect(python_example.first.content).to eq 'print "Hello World"'
  end
end
