
describe "date_math.rb" do
  it "should output '8959' when today is Jul 1, 2020", points: 1 do
    # Set today's date to 1995-12-22
    allow(Date).to receive(:today).and_return Date.new(2020,07,1)
    
    output = with_captured_stdout { require_relative('../../date_math')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Ruby is 8959 days old/i)).to be(true),
      "Expected output to be 'Ruby is 8959 days old', but was #{output}."
  end
end

describe "date_math.rb" do
  it "is not 'hard-coded' to the current date'", points: 1 do
    # Un-require date_math.rb
    date_math_file = $".select{|r| r.include? 'date_math.rb'}
    $".delete(date_math_file.first)

    # Set today's date to 1995-12-22
    allow(Date).to receive(:today).and_return Date.new(1995,12,22)
    
    output = with_captured_stdout { require_relative('../../date_math')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Ruby is 1 days old/i)).to be(true),
      "Expected output to be 'Ruby is 1 days old', but was #{output}."
  
  end
end

describe "date_formatted.rb" do
  it "outputs 'The year is: 2020, the calendar day is: 1, and the month is: 7.' when today is July 1, 2020", points: 1 do
    
    # Set today's date to 2020-07-01
    allow(Date).to receive(:today).and_return Date.new(2020,07,01)

    output = with_captured_stdout { require_relative('../../date_formatted')} 
    output = "empty" if output.empty? 
    expect(output.match?(/The year is: 2020, the calendar day is: 1, and the month is: 7/i)).to be(true),
      "Expected output to be 'The year is: 2020, the calendar day is: 1, and the month is: 7', but was #{output}."
  
  end
end

describe "date_formatted.rb" do
  it "outputs the formatted dates for any past/future date", points: 1 do
    # Un-require date_formatted.rb
    date_formatted_file = $".select{|r| r.include? 'date_formatted.rb'}
    $".delete(date_formatted_file.first)

    # Set today's date to Monday- 2020-06-29
    allow(Date).to receive(:today).and_return Date.new(2020,06,29)
    
    output = with_captured_stdout { require_relative('../../date_formatted')} 
    output = "empty" if output.empty? 
    expect(output.match?(/The year is: 2020, the calendar day is: 29, and the month is: 6/i)).to be(true),
      "Expected output to be 'The year is: 2020, the calendar day is: 29, and the month is: 6', but was #{output}."
  end
end


describe "date_monday.rb" do
  it "should output 'Is today Monday? true', when today is Monday", points: 1 do
    # Set today's date to Monday- 2020-06-29
    allow(Date).to receive(:today).and_return Date.new(2020,06,29)
    allow(Time).to receive(:now).and_return Time.new(2020,06,29)
    
    output = with_captured_stdout { require_relative('../../date_monday')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Is today Monday\? true/i)).to be(true),
      "Expected output to be 'Is today Monday? true', but was #{output}."
  end
end

describe "date_monday.rb" do
  it "should output 'Is today Monday? false', when today is not Monday", points: 1 do
    # Un-require date_monday.rb
    date_monday_file = $".select{|r| r.include? 'date_monday.rb'}
    $".delete(date_monday_file.first)

    # Set today's date to Wednesday- 2020-07-01
    allow(Date).to receive(:today).and_return Date.new(2020,07,01)
    allow(Time).to receive(:now).and_return Time.new(2020,07,01)

    output = with_captured_stdout { require_relative('../../date_monday')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Is today Monday\? false/i)).to be(true),
      "Expected output to be 'Is today Monday? false', but was #{output}."

  end
end

def with_captured_stdout
  original_stdout = $stdout  # capture previous value of $stdout
  $stdout = StringIO.new     # assign a string buffer to $stdout
  yield                      # perform the body of the user code
  $stdout.string             # return the contents of the string buffer
ensure
  $stdout = original_stdout  # restore $stdout to its previous value
end
