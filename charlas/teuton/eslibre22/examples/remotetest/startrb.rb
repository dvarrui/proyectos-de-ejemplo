# File: remotetest/start.rb
group "Remote test" do
  target "Existe el usuario Obiwan"
  run "id Obiwan", on: :host1
  expect "Obiwan"
end

play do
  show
  export format: :html
  send copy_to: :host1
end
