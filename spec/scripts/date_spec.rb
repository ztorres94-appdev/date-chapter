
describe "date_math.rb" do
  it "should output '8959' when today is Jul 1, 2020", points: 1 do
    # Set today's date to 1995-12-22
    allow(Date).to receive(:today).and_return Date.new(2020,07,1)
    
    expect { require_relative '../../date_math' }.to output(/Ruby is 8959 days old/).to_stdout

  end
end

describe "date_math.rb" do
  it "is not 'hard-coded' to the current date'", points: 1 do
    # Un-require date_math.rb
    date_math_file = $".select{|r| r.include? 'date_math.rb'}
    $".delete(date_math_file.first)

    # Set today's date to 1995-12-22
    allow(Date).to receive(:today).and_return Date.new(1995,12,22)
    
    expect { require_relative '../../date_math' }.to output(/Ruby is 1 days old/).to_stdout
    
  end
end

describe "date_formatted.rb" do
  it "outputs 'The year is: 2020, the calendar day is: 1, and the month is: 7.' when today is July 1, 2020", points: 1 do
    
    # Set today's date to 2020-07-01
    allow(Date).to receive(:today).and_return Date.new(2020,07,01)

    expect { require_relative '../../date_formatted' }.to output(/The year is: 2020, the calendar day is: 1, and the month is: 7/).to_stdout
  end
end

describe "date_formatted.rb" do
  it "outputs the formatted dates for any past/future date", points: 1 do
    # Un-require date_formatted.rb
    date_formatted_file = $".select{|r| r.include? 'date_formatted.rb'}
    $".delete(date_formatted_file.first)

    # Set today's date to Monday- 2020-06-29
    allow(Date).to receive(:today).and_return Date.new(2020,06,29)
    

    expect { require_relative '../../date_formatted' }.to output(/The year is: 2020, the calendar day is: 29, and the month is: 6/).to_stdout
  end
end


describe "date_monday.rb" do
  it "should output 'Is today Monday? true', when today is Monday", points: 1 do
    # Set today's date to Monday- 2020-06-29
    allow(Date).to receive(:today).and_return Date.new(2020,06,29)
    allow(Time).to receive(:now).and_return Time.new(2020,06,29)
    

    expect { require_relative '../../date_monday' }.to output(/Is today Monday\? true/).to_stdout
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
    

    expect { require_relative '../../date_monday' }.to output(/Is today Monday\? false/).to_stdout
  end
end
