# frozen_string_literal: true

shared_examples 'Readability counts' do |py|
  describe command("#{py} -m this") do
    its(:stderr) { should be_empty }
    its(:stdout) { should match(/Readability counts\./) }
  end
end

describe 'python interpreter' do
  describe command('python --version') do
    its(:stderr) { should match(/^Python \d+\.\d+\.\d+/) }
  end

  include_examples 'Readability counts', 'python'
end

describe 'python3 interpreter' do
  describe command('python --version') do
    its(:stderr) { should match(/^Python \d+\.\d+\.\d+/) }
  end

  include_examples 'Readability counts', 'python3'
end
