require 'messages'

describe Messages do
  describe '.all' do
    it 'shows all of the peeps(messages)' do
      messages = Messages.all
      expect(messages).to include('We are learning how to build a full-stack application')
      expect(messages).to include('From Monday we will no longer be the newest cohort')
      expect(messages).to include('Tweets sound better than peeps')
    end
  end
end