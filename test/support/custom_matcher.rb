def be_past_date(attribute)
  test "#{attribute} should not be in the future" do
    subject.send("#{attribute}=", Date.current + 1.day)
    assert_not subject.send(attribute) <= Date.current
   end
end
