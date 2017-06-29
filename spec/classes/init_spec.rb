require 'spec_helper'
describe 'atom_editor' do

  context 'with defaults for all parameters' do
    it { should contain_class('atom_editor') }
  end
end
