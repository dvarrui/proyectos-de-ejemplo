# File: localtest/start.rb
group "Local test" do
  target "Existe el usuario Obiwan"
  run "id Obiwan"
  expect "Obiwan"
end
