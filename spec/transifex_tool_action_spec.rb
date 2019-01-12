describe Fastlane::Actions::TransifexToolAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The transifex_tool plugin is working!")

      Fastlane::Actions::TransifexToolAction.run(nil)
    end
  end
end
