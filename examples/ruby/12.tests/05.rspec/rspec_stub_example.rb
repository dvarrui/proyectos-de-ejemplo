
RSpec.describe "Stub example" do
  it "calls the stub method" do
    stub = double("json")
    allow(stub).to receive(:response) do
      {"blog"=>"rubyguides.com", "rating"=>"5/5"}.to_json
    end
  end
end
