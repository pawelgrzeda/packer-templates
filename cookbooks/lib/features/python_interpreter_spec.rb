# frozen_string_literal: true

shared_examples 'python interpreter' do |py|
  describe command("#{py} -m this") do
    its(:stderr) { should be_empty }
    its(:stdout) { should match(/Readability counts\./) }
  end

  describe command('python --version') do
    its(:stderr) { should match(/^Python \d+\.\d+\.\d+/) }
  end
end

describe 'python2 interpreter' do
  include_examples 'python interpreter', 'python'
end

describe 'python3 interpreter' do
  include_examples 'python interpreter', 'python3'
end
